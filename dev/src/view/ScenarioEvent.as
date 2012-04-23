package view 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Arthur Tofani
	 */
	public class ScenarioEvent extends Event 
	{
		
		private var _vars:Object = new Object();
		public function ScenarioEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ScenarioEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ScenarioEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public static const PLANT_SEED:String = "PlantSeed";
		public static const PLANT_FIXED:String = "PlantFixed";
		
		public function get vars():Object 
		{
			return _vars;
		}
		
		public function set vars(value:Object):void 
		{
			_vars = value;
		}
		
	}
	
}