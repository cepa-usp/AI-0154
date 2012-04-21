package model 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Arthur
	 */
	public class PlantInstance 
	{
		private var plant:Plant;
		private var environment:Enviro;
		private var position:Point = new Point( -1, -1);
		private var state:int = 0;
		
		public function PlantInstance(plant:Plant, environment:Enviro) {
			
		}
		
		private function getPosition():Point {
			return position;
		}
		private function setPosition(x:int, y:int) {
			position.x = x;
			position.y = y;
		}
		
		public static const STATE_UNLOADED:int = 0;
		public static const STATE_POSITION_RIGHT:int = 0;
		public static const STATE_POSITION_WRONG:int = 0;
		
	}

}