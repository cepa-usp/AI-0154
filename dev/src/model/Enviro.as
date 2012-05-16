package model 
{
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Arthur
	 */
	public class Enviro 
	{
		private var _width:int = 0;
		private var _height:int = 0;
		private var plantregions:Array;
		private var reg:Array;
		
		public function Enviro(width:int, height:int) 
		{
			this.width = width;
			this.height = height;
			preparePlantRegions(10);
		}
		
		public function preparePlantRegions(amntSpecies) {
			reg = new Array(amntSpecies);
			for (var i:int = 0; i < amntSpecies; i++ ) {
				reg[i] = new Array();
			}			
			plantregions = new Array(width)
			for (var x:int = 0; x < width; x++) {
				plantregions[x] = new Array(height);
				for (var y:int  = 0; y < height; y++) {
					plantregions[x][y] = new Array(amntSpecies);
					for (var i:int = 0; i < amntSpecies; i++ ) {
						plantregions[x][y][i] = false;
					}
				}
			}			
		}
		
		public function setRegionsForPlant(plantId:int, rect:Rectangle) {
			for (var x:int = 0; x < rect.width; x++ ) {
				for (var y:int = 0; y < rect.height; y++ ) {
					setRegionsForPlant2(plantId, x, y);
				}				
			}
		}


		public function setAreaForPlant(plantId:int, a:Area) {
			var area:Array = a.areas;
			for (var i:int = 0; i < area.length; i++) {
				if (area[i] is Array) {
					setRegionsForPlant2(plantId, area[i][0], area[i][1]);
				 } else if(area[i] is Rectangle){
					 setRegionsForPlant(plantId, area[i]);
				 }				
			}
		}		
		
		public function setRegionsForPlant2(plantId:int, x:int,  y:int) {
			plantregions[x][y][plantId] = true;
			reg[plantId].push([x, y]);
		}
		
		public function isPositionForPlant(id:int, x:int, y:int):Boolean 
		{
			var a:Array = plantregions[x][y];
			return (a[id]);
		}
		
		public function get width():int 
		{
			return _width;
		}
		
		public function set width(value:int):void 
		{
			_width = value;
		}
		
		public function get height():int 
		{
			return _height;
		}
		
		public function set height(value:int):void 
		{
			_height = value;
		}
		

		
	}

}