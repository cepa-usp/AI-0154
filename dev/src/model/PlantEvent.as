package model 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Arthur Tofani
	 */
	public class PlantEvent extends Event 
	{
		
		
		private var _instance:PlantInstance;
		private var _plant:Plant;
		private var vars:Object = new Object();
		
		public static const STATE_CHANGED:String = "StateChanged";
		public static const POSITION_SET:String = "PositionSet";
		
		public function PlantEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new PlantEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("PlantEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		
		
		
		public function get instance():PlantInstance 
		{
			return _instance;
		}
		
		public function set instance(value:PlantInstance):void 
		{
			_instance = value;
		}
		
		public function get plant():Plant 
		{
			return _plant;
		}
		
		public function set plant(value:Plant):void 
		{
			_plant = value;
		}
		
	}
	
}