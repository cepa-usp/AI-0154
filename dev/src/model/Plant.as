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
		private var _id:String = "";
		private const AMNT_INSTANCES:int = 5;
		private var _hintsShow:Vector.<String> = new Vector.<String>();
		private var _instances:Vector.<PlantInstance>;
		
		public function Plant(id:String) 
		{
			this.id = id;			
			fetch();
		}
		
		public function createInstances() {
			for (var i:int = 0; i < AMNT_INSTANCES; i++) {
				
			}
		}
		
		/**
		 * gets data from resources' folder
		 */
		public function fetch() {
			
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
		
		public function get id():String 
		{
			return _id;
		}
		
		public function set id(value:String):void 
		{
			_id = value;
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

	}

}