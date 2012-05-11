package view 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import model.Plant;
	import model.PlantEvent;
	import model.PlantInstance;
	/**
	 * ...
	 * @author Arthur Tofani
	 */
	public class PlantGraphics extends Sprite
	{
		
		private var _src:MovieClip		
		private var _state:int = STATE_STOP;
		private var _instance:PlantInstance = null;
		private var _plant:Plant = null;
	
		public function PlantGraphics() 
		{

		}
		
		public function changeState(state:int):void {			
			this._state = state;
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			src.gotoAndStop(state);
			if (state > 0) {
				src.addEventListener(Event.ENTER_FRAME, onEnterFrame);
				src.play();
			}
		}
		
		
		private static function preparePlant(src:MovieClip):PlantGraphics {
			var p:PlantGraphics = new PlantGraphics();
			p.src = src;
			p.addChild(src);
			p.changeState(STATE_STOP);
			return p;
		}
				
		private function onEnterFrame(e:Event):void {
			trace(src.currentFrame);
			if (src.currentFrame >= (_state + FRAMES - 1)) {
				if (_state == STATE_DEAD) {
					onDead();
					return;
				}
				src.gotoAndPlay(_state);
			}
		}
		
		private function onDead():void {
			src.stop();
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		public static function getPlantGraphics(id:int):PlantGraphics {
			switch(id) {
				case 1:
					return preparePlant(new Plant1());
					break;
				case 2:
					return preparePlant(new Plant2());
					break;					
				case 3:
					return preparePlant(new Plant3());
					break;					
				case 4:
					return preparePlant(new Plant4());
					break;					
				case 5:
					return preparePlant(new Plant5());
					break;										
				case 6:
					return preparePlant(new Plant6());				
					break;							
				case 7:
					return preparePlant(new Plant7());
					break;										
				case 8:
					return preparePlant(new Plant8());
					break;															
			}
			return null;
		}
		

		public function get src():MovieClip 
		{
			return _src;
		}
		
		public function set src(value:MovieClip):void 
		{
			_src = value;
		}
		
		public function get state():int 
		{
			return _state;
		}
		
		private function set state(value:int):void 
		{
			_state = value;
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
		
		public function onPlantInstanceStateChanged(e:PlantEvent):void 
		{
			if (e.instance == this.instance) {
				if (instance.state == PlantInstance.STATE_POSITION_RIGHT) {
					changeState(STATE_ALIVE)
				} else if (instance.state == PlantInstance.STATE_POSITION_WRONG) {
					changeState(STATE_DEAD);
				}
				
			}
		}
		
		private const FRAMES:int = 30;
		public static const STATE_STOP:int = 1;
		public static const STATE_MOUSEOVER:int = 40
		public static const STATE_ALIVE:int = 80
		public static const STATE_DEAD:int = 120;
				
	}

}