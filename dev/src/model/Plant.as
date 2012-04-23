package model 
{
	/**
	 * ...
	 * @author Arthur
	 */
	public class Plant 
	{
		private var _hints:Vector.<String> = new Vector.<String>();
		private var _name:String = "";
		private var _id:int = 0;
		private var _hintsShow:Vector.<String> = new Vector.<String>();
		private var _instances:Vector.<PlantInstance>;
		private var _currentInstance:int = 0;
		private var mdl:Model;
		
		public function Plant(id:int, mdl:Model) 
		{
			this.mdl = mdl;
			this.id = id;			
		}
		
		public function createInstances(amnt:int, env:Enviro) {
			_instances = new Vector.<PlantInstance>();
			for (var i:int = 0; i < amnt; i++) {
				_instances.push(new PlantInstance(this, env));
			}
		}
		
		public function getAvailableInstances():int {
			var qt:int = 0;
			for each(var pi:PlantInstance in instances) {
				if (pi.state = PlantInstance.STATE_UNLOADED) {
					qt++;
				}
			}
			return qt;
		}

		public function get hints():Vector.<String> 
		{
			return _hints;
		}
		
		public function set hints(value:Vector.<String>):void 
		{
			_hints = value;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		
		public function get hintsShow():Vector.<String> 
		{
			return _hintsShow;
		}
		
		public function set hintsShow(value:Vector.<String>):void 
		{
			_hintsShow = value;
		}
		
		public function get instances():Vector.<PlantInstance> 
		{
			return _instances;
		}
		
		public function set instances(value:Vector.<PlantInstance>):void 
		{
			_instances = value;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
		public function get currentInstance():int 
		{
			return _currentInstance;
		}
		
		public function set currentInstance(value:int):void 
		{
			_currentInstance = value;
		}

		public function seedInstance(x:int, y:int) {
			instances[currentInstance].setPosition(x, y);
		}
		
		public function notifyInstanceStateChange(inst:PlantInstance) {
			var ev:PlantEvent = new PlantEvent(PlantEvent.STATE_CHANGED)
			ev.instance = inst;
			ev.plant = this;
			mdl.eventDispatcher.dispatchEvent(ev);			
		}
		public function notifyInstancePositionSet(inst:PlantInstance) {
			var ev:PlantEvent = new PlantEvent(PlantEvent.POSITION_SET)
			ev.instance = inst;
			ev.plant = this;			
			mdl.eventDispatcher.dispatchEvent(ev);
			currentInstance++;
		}
	}

}