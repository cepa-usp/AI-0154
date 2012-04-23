package view 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import model.Model;
	import model.Plant;
	/**
	 * ...
	 * @author Arthur Tofani
	 */
	public class PlantPicker extends PlantPickerSprite
	{
		private var mdl:Model;		
		public function PlantPicker(mdl:Model) 
		{
			this.mdl = mdl;
			drawPicker();
		}
		
		public function drawPicker():void {
			var pos:int = 10;
			var i:int = 0;
			for each (var p:Plant in mdl.plants) {
				var plantContainer:PlantContainerViewer = new PlantContainerViewer(p);
				var plantImage:PlantGraphics = PlantGraphics.getPlantGraphics(p.id);
				var scaleW:Number = (plantContainer.width - 10) / plantImage.width
				var scaleH:Number = (plantContainer.height - 10) / plantImage.height
				var scaleFactor:Number = Math.min(scaleW, scaleH);
				plantImage.scaleX = scaleFactor;				
				plantImage.scaleY = scaleFactor;
				plantImage.x = plantContainer.width / 2;
				plantImage.y = plantContainer.height / 2;
				plantImage.name = "plantImage";
				plantContainer.name = "plantContainer_" + i;
				plantContainer.mouseChildren = false;
				plantContainer.txQtde.text = String(p.getAvailableInstances());
				plantContainer.pictureContainer.addChild(plantImage);
				plantContainer.addEventListener(MouseEvent.MOUSE_OVER, onPlantContainerMouseOver);
				plantContainer.addEventListener(MouseEvent.MOUSE_OUT, onPlantContainerMouseOut);				
				addChild(plantContainer);
				plantContainer.x = pos
				pos += plantContainer.width + 5;
				i++;
			}			
			
		}
		
		private function onPlantContainerMouseOver(e:MouseEvent):void 
		{
			PlantGraphics(PlantContainerViewer(e.target).pictureContainer.getChildByName("plantImage")).changeState(PlantGraphics.STATE_MOUSEOVER);
		}
		
		private function onPlantContainerMouseOut(e:MouseEvent):void 
		{
			PlantGraphics(PlantContainerViewer(e.target).pictureContainer.getChildByName("plantImage")).changeState(PlantGraphics.STATE_STOP);
		}
		
	}

}