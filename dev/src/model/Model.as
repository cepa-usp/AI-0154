package model 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Arthur
	 */
	public class Model 
	{
		private var _plants:Vector.<Plant> = new Vector.<Plant>();
		private var _environment:Enviro;
		private var eventDispatcher:EventDispatcher = new EventDispatcher();
		public function Model()
		{
			PlantLoader.getInstance().load(this);
			EnvironmentLoader.getInstance().load(this);
			eventDispatcher.dispatchEvent(new Event("MODEL_LOADED"));
		}
		
		public function get plants():Vector.<Plant> 
		{
			return _plants;
		}
		
		public function set plants(value:Vector.<Plant>):void 
		{
			_plants = value;
		}
		
		public function get environment():Enviro 
		{
			return _environment;
		}
		
		public function set environment(value:Enviro):void 
		{
			_environment = value;
		}
		

		
	}

}