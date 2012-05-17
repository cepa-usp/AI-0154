package 
{
	import cepa.AI;
	import cepa.AIObserver;
	import controller.ScenarioController;
	import flash.display.Sprite;
	import flash.events.Event;
	import model.Model;
	import tutorial.Tutorial;
	import view.Scenario;
	
	/**
	 * ...
	 * @author Arthur
	 */
	public class Main extends Sprite implements AIObserver
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private var ai:AI; 
		private function init(e:Event = null):void 
		{			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			ai = new AI(this);
			var mdl:Model = new Model();
			var scenario:Scenario = new Scenario(mdl);			
			//addChild(scenario);
			ai.container.addChild(scenario);
			var ctrl:ScenarioController = new ScenarioController(mdl, scenario);
			
		}
		
		
		
		/* INTERFACE cepa.AIObserver */
		
		public function onResetClick() 
		{
			
		}
		
		public function onScormFetch() 
		{
			
		}
		
		public function onScormSave() 
		{
			
		}
		
		public function onTutorialClick() 
		{
		 var tut:Tutorial = new Tutorial();
		 //tut.
		 ai.container.addChild(tut);
		 
		}
		
	}
	
}