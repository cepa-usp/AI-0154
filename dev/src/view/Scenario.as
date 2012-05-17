package view 
{
	import cepa.AIObserver;
	import com.eclecticdesignstudio.motion.Actuate;
	import flash.accessibility.Accessibility;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import model.Area;
	import model.Areas;
	import model.Model;
	import model.Plant;
	import model.PlantEvent;
	import model.PlantInstance;
	/**
	 * ...
	 * @author Arthur
	 */
	public class Scenario extends Sprite implements AIObserver
	{
		
		private var mdl:Model;
		private var debug:Boolean = true;
		private var layer_background:Sprite;
		private var layerGhost:Sprite = new Sprite();
		private var layerPlants:Sprite = new Sprite();
		private var layerGrid:Sprite = new Sprite();
		private var layerBlocks:Sprite = new Sprite();
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
			drawGrid();
		}
		
		private function bindModelEvents():void 
		{
			mdl.eventDispatcher.addEventListener(PlantEvent.POSITION_SET, onPlantPositionSet);
			mdl.eventDispatcher.addEventListener(PlantEvent.STATE_CHANGED, onPlantStateChanged);
		}
		
		private function highLightArea(a:Area):void {
			layerBlocks.graphics.clear();			
			for (var i:int = 0; i < a.areas.length; i++ ) {
				if (a.areas[i] is Array) {
					highLightArea2(a.areas[i][0], a.areas[i][1], a.cor);
				}
				if (a.areas[i] is Rectangle) {
					var r:Rectangle = a.areas[i];
					for (var x:int = r.x; x < r.x + r.width; x++) {
						for (var y:int = r.y; y < r.y + r.height; y++) {
							highLightArea2(x, y, a.cor);	
						}
					}
					
				}				
			}
		}
		
		private function highLightArea2(x:int, y:int, color:int) {		
			var w:int = width;
			var h:int = height;

			var qtx = w / mdl.environment.width;
			var qty = h / mdl.environment.height;
			var offx = 0; // qtx / 2 +1 ;
			var offy = 0; //qty / 2 + 2;
			layerBlocks.graphics.beginFill(color);
			layerBlocks.graphics.drawRect(offx + x * qtx, offy + y * qty, qtx, qty);
			
		}
		
		private function drawGrid():void {
/*			highLightArea(Areas.RelevoSombra);
			highLightArea(Areas.PlanoIluminado);
			highLightArea(Areas.MediaSombra);
			highLightArea(Areas.MorroMataVerde);
			highLightArea(Areas.Floresta); */
			layerGrid.graphics.lineStyle(1, 0, 1);			
			var w:int = width;
			var h:int = height;

			var qtx = w / mdl.environment.width;
			var qty = h / mdl.environment.height;
			var offx = 0; //qtx/2 +1 ;
			var offy = 0; //qty/2 + 2;			
			for (var x:int = 0; x < mdl.environment.width; x ++  ) {
				layerGrid.graphics.moveTo(offx + x * qtx, 0);				
				layerGrid.graphics.lineTo(offx + x * qtx, h);
			}
			for (var y:int = 0; y < mdl.environment.height; y++ ) {
				layerGrid.graphics.moveTo(0, offy + y * qty);				
				layerGrid.graphics.lineTo(w, offy + y * qty);				
			}							
		}
		
		private function onPlantStateChanged(e:PlantEvent):void 
		{
			// ajusta pontuação
		}
		

		
		private function onPlantPositionSet(e:PlantEvent):void 
		{			
			var pg:PlantGraphics = PlantGraphics.getPlantGraphics(e.plant.id);
			pg.mouseChildren = false;
			pg.instance = e.instance;
			pg.plant = e.plant;
			mdl.eventDispatcher.addEventListener(PlantEvent.STATE_CHANGED, pg.onPlantInstanceStateChanged);
			var p:Point = getPixelPosition(e.instance.getPosition().x, e.instance.getPosition().y);			
			pg.x = p.x + (pg.width/2);
			pg.y = p.y + (pg.height/2);
			var scaleW:Number = getSquareWidth() / pg.width 
			var scaleH:Number = getSquareHeight() / pg.height
			var scaleFactor:Number = Math.min(scaleW, scaleH);
			scaleFactor *= 2;
			//pg.scaleX = scaleFactor;
			//pg.scaleY = scaleFactor;
			layerPlants.addChild(pg);
			pg.addEventListener(MouseEvent.MOUSE_OVER, onFixedPlantMouseOver);
			pg.addEventListener(MouseEvent.MOUSE_OUT, onFixedPlantMouseOut);
			plants.push(pg);
			Actuate.timer(2).onComplete(plantFixed, pg.instance)
		}
		
		private function onFixedPlantMouseOut(e:MouseEvent):void 
		{
			hideAreas();

		}
		
		private function onFixedPlantMouseOver(e:MouseEvent):void 
		{
						var p:Plant = PlantGraphics(e.target).plant;			
			showAreas(p);
				
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
			layer_background.alpha = 0.71;
			addChild(layer_background);
			layerGround = new Sprite();
			addChild(layerGround);
			layerPlants = new Sprite();
			addChild(layerBlocks);
			addChild(layerGrid);
			addChild(layerPlants);
			plantPicker = new PlantPicker(mdl);
			plantPicker.x = 2;
			plantPicker.y = this.height - plantPicker.height + 1;
			bindPicker();

			addChild(plantPicker);
			addChild(plantDetails);			
			plantDetails.alpha = 0.01;
			hideDetails();
			addChild(layerGhost);
			
		}
		
		private function createGhost(plantContainer:PlantContainerViewer):void {
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
				mdl.eventDispatcher.addEventListener(PlantEvent.STATE_CHANGED, pc.onPlantStateChanged);
				pc.addEventListener(MouseEvent.MOUSE_OVER, onPlantContainerMouseOver);
				pc.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
					hideDetails();
				});	
				pc.addEventListener(MouseEvent.MOUSE_OUT, onPlantContainerMouseOut);
				pc.addEventListener(MouseEvent.MOUSE_DOWN, onPlantContainerMouseDown);
			}
		}
		
		private function onPlantContainerMouseOut(e:MouseEvent):void 
		{
			
			hideAreas();
			
		}
		
		private function showAreas(p:Plant) {
			if (!p.correct) return;
			for each(var a:Area in  p.areas) {
				highLightArea(a);
			}
			Actuate.tween(layerBlocks, 0.5, { alpha:0.4 } );
		}
		
		private function hideAreas() {
			Actuate.tween(layerBlocks, 0.5, { alpha:0.0 } );
		}
		
		private function onPlantContainerMouseDown(e:MouseEvent):void 
		{
			
			if (!PlantContainerViewer(e.target).enabled) return;
			hideDetails(0.5);
			createGhost(PlantContainerViewer(e.target));
		}
		
		private function onPlantContainerMouseOver(e:MouseEvent):void 
		{
			var p:Plant = PlantContainerViewer(e.target).plant;
			showAreas(p);

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
				dica.x = plantDetails.hintContainer.x;
				dica.y = plantDetails.hintContainer.y + ((d) * dica.height);
				plantDetails.addChild(dica);
				if (d == 2) break;
			}
			
			plantDetails.y = plantPicker.y - 15;
			var offX:int  = plantDetails.width / 2
			if (p.id >= 5) {
				offX *= -1;
				plantDetails.setaDir.visible = true;
				plantDetails.setaEsq.visible = false;
			} else {
				plantDetails.setaDir.visible = false;
				plantDetails.setaEsq.visible = true;				
			}
			plantDetails.x = (plantPicker.x + plantContainer.x) + offX;
			
		}
		private function showDetails():void {
				Actuate.tween(plantDetails, 1, { alpha:1 } );
		}
		private function hideDetails(vel:int = 1) {
			
			Actuate.tween(plantDetails, vel, { alpha:0 } );
		}
		
		/* INTERFACE cepa.AIObserver */
		
		public function onResetClick() 
		{
			
		}
		
		public function onScormFetch() 
		{
			
		}
		
		public function onScormSave() 
		{
			
		}
		
		public function onTutorialClick() 
		{
			
		}
		
		/* INTERFACE cepa.AIObserver */
		

		
	}

}