package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import model.Model;
	import view.Scenario;
	
	/**
	 * ...
	 * @author Arthur
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var mdl:Model = new Model();
			var scenario:Scenario = new Scenario();
			
			
		}
		
	}
	
}