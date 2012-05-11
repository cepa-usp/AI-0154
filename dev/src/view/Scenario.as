package view 
{
	import com.eclecticdesignstudio.motion.Actuate;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import model.Model;
	import model.Plant;
	import model.PlantEvent;
	import model.PlantInstance;
	/**
	 * ...
	 * @author Arthur
	 */
	public class Scenario extends Sprite
	{
		
		private var mdl:Model;
		private var layer_background:Sprite;
		private var layerGhost:Sprite = new Sprite();
		private var layerPlants:Sprite = new Sprite();
		private var plantDetails:PlantDetails = new PlantDetails();
		private var plants:Vector.<PlantGraphics> = new Vector.<PlantGraphics>();
		private var plantPicker:PlantPicker;
		private var layerGround:Sprite;
		private var ghost:PlantGraphics;
		
		public function Scenario(mdl:Model) 
		{
			this.mdl = mdl;
			bindModelEvents();
			loadScenario();
		}
		
		private function bindModelEvents():void 
		{
			mdl.eventDispatcher.addEventListener(PlantEvent.POSITION_SET, onPlantPositionSet);
			mdl.eventDispatcher.addEventListener(PlantEvent.STATE_CHANGED, onPlantStateChanged);
		}
		
		private function onPlantStateChanged(e:PlantEvent):void 
		{
			// ajusta pontuação
		}
		
		private function onPlantPositionSet(e:PlantEvent):void 
		{			
			var pg:PlantGraphics = PlantGraphics.getPlantGraphics(e.plant.id);
			pg.instance = e.instance;
			pg.plant = e.plant;
			mdl.eventDispatcher.addEventListener(PlantEvent.STATE_CHANGED, pg.onPlantInstanceStateChanged);
			var p:Point = getPixelPosition(e.instance.getPosition().x, e.instance.getPosition().y);			
			pg.x = p.x;
			pg.y = p.y;
			var scaleW:Number = getSquareWidth() / pg.width
			var scaleH:Number = getSquareHeight() / pg.height
			var scaleFactor:Number = Math.min(scaleW, scaleH);
			scaleFactor *= 2;
			pg.scaleX = scaleFactor;
			pg.scaleY = scaleFactor;
			layerPlants.addChild(pg);
			plants.push(pg);
			Actuate.timer(2).onComplete(plantFixed, pg.instance)
		}

		private function plantFixed(instance:PlantInstance):void {
			var ev:ScenarioEvent = new ScenarioEvent(ScenarioEvent.PLANT_FIXED, true);
			ev.vars.instance = instance;
			dispatchEvent(ev);
		}
		
		
	
		


		
		public function getSquareWidth():Number {
			return width / mdl.environment.width;
		}
		public function getSquareHeight():Number {
			return height / mdl.environment.height;
		}		
		public function getSquare(pixelX:int, pixelY:int):Point {
			return new Point(pixelX / getSquareWidth(), pixelY/getSquareHeight());
		}
		public function getPixelPosition(sqx:int, sqy:int):Point {
			return new Point(sqx * getSquareWidth(), sqy * getSquareHeight())
		}
		
		
		
		public function loadScenario():void {
			layer_background = new BackgroundScenario();						
			addChild(layer_background);
			layerGround = new Sprite();
			addChild(layerGround);
			layerPlants = new Sprite();
			addChild(layerPlants);
			plantPicker = new PlantPicker(mdl);
			plantPicker.x = 10;
			plantPicker.y = this.height - plantPicker.height + 10;
			bindPicker();
			addChild(plantPicker);
			addChild(plantDetails);
			addChild(layerGhost);
		}
		
		private function createGhost(plantContainer:PlantContainerViewer) {
			ghost =  PlantGraphics.getPlantGraphics(plantContainer.plant.id);
			ghost.plant = plantContainer.plant;
			ghost.changeState(PlantGraphics.STATE_MOUSEOVER);
			ghost.alpha = 0.7;
			var sc:Number = plantContainer.pictureContainer.getChildByName("plantImage").scaleX;
			ghost.scaleX = sc;
			ghost.scaleY = sc;
			layerGhost.addChild(ghost);
			ghost.mouseChildren = false;
			ghost.x = mouseX;
			ghost.y = mouseY - ghost.height/2;
			ghost.startDrag(false);
			
			
			stage.addEventListener(MouseEvent.MOUSE_UP, onGhostMouseUp)
			
		}
		
		private function onGhostMouseUp(e:MouseEvent):void 
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, onGhostMouseUp)
			layerGhost.removeChild(ghost);
			var ev:ScenarioEvent = new ScenarioEvent(ScenarioEvent.PLANT_SEED, true);
			ev.vars.position = getSquare(e.stageX, e.stageY);
			ev.vars.plant = ghost.plant;
			dispatchEvent(ev);
			
		}
		
		private function bindPicker():void {
			for (var i:int = 0;i < mdl.plants.length; i++) {				
				var pc:PlantContainerViewer = PlantContainerViewer(plantPicker.getChildByName("plantContainer_" + i));
				pc.mouseChildren = false;
				pc.buttonMode = true;
				pc.useHandCursor = true;
				mdl.eventDispatcher.addEventListener(PlantEvent.INSTANCE_CHANGED, pc.onInstanceChanged);
				pc.addEventListener(MouseEvent.MOUSE_OVER, onPlantContainerMouseOver);
				pc.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
					hideDetails();
				});	
				pc.addEventListener(MouseEvent.MOUSE_DOWN, onPlantContainerMouseDown);
			}
		}
		
		private function onPlantContainerMouseDown(e:MouseEvent):void 
		{
			if (!PlantContainerViewer(e.target).enabled) return;
			hideDetails(0.5);
			createGhost(PlantContainerViewer(e.target));
		}
		
		private function onPlantContainerMouseOver(e:MouseEvent):void 
		{
			var pc2:PlantContainerViewer = PlantContainerViewer(e.target);
			populateDetails(pc2.plant, pc2);
			showDetails();
		}
		
		
		
		private function populateDetails(p:Plant, plantContainer:PlantContainerViewer):void {
			plantDetails.txPlantName.text = p.name;
			for (var q:int = plantDetails.numChildren - 1; q >=0; q-- ) {
				if (plantDetails.getChildAt(q) is Dica) {
					plantDetails.removeChildAt(q);
				}
			}
			for (var d:int = 0; d < p.hintsShow.length; d++) {
				var dica:Dica = new Dica();
				dica.txNumHint.text = String(d + 1);
				dica.txTextHint.text = p.hintsShow[d];
				dica.y = plantDetails.hintContainer.y + ((d+1) * dica.height);
				plantDetails.addChild(dica);
				if (d == 2) break;
			}
			
			plantDetails.y = plantPicker.y - 15;
			plantDetails.x = (plantPicker.x + plantContainer.x + (plantContainer.width / 2)) + 30;
		}
		private function showDetails():void {
				Actuate.tween(plantDetails, 1, { alpha:1 } );
		}
		private function hideDetails(vel:int=1) {
			Actuate.tween(plantDetails, vel, { alpha:0 } );
		}
		
	}

}