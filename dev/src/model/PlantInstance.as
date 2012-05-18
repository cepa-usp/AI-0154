package model 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Arthur
	 */
	public class PlantInstance 
	{
		private var _plant:Plant;
		private var environment:Enviro;
		private var _position:Point = new Point( -1, -1);
		private var _state:int = 0;
		
		public static const STATE_UNLOADED:int = 0;
		public static const STATE_EVALUATING:int = 3;
		public static const STATE_POSITION_RIGHT:int = 1;
		public static const STATE_POSITION_WRONG:int = 2;		
		
		public function PlantInstance(plant:Plant, environment:Enviro) {
			this.plant = plant;
			this.environment = environment;
		}
		
		public function getPosition():Point {
			return _position;
		
		}
		public function setPosition(x:int, y:int):void {
			state = STATE_EVALUATING;
			_position.x = x;
			_position.y = y;			
			plant.notifyInstancePositionSet(this);
		}
		
		public function evaluatePosition():void {
			if (environment.isPositionForPlant(plant.id, _position.x, _position.y)) {
				state = STATE_POSITION_RIGHT;
			} else {
				state = STATE_POSITION_WRONG;
			}
		}
		

		
		public function get plant():Plant 
		{
			return _plant;
		}
		
		public function set plant(value:Plant):void 
		{
			_plant = value;
		}
		

		
		public function get state():int 
		{
			return _state;
		}
		
		public function set state(value:int):void 
		{
			_state = value;
			plant.notifyInstanceStateChange(this);
			
		}
		
	}

}