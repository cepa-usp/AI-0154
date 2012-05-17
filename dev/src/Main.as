package 
{
	import cepa.AI;
	import cepa.AIObserver;
	import controller.ScenarioController;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import model.Model;
	import tutorial.CaixaTexto;
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
		private var tut:Tutorial = new Tutorial();
		private var scenario:Scenario;
		private function init(e:Event = null):void 
		{			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			fazerTutorial();			
			ai = new AI(this);
			ai.addObserver(this)
			startLO();

			
		}
		
		private function startLO() {
			var mdl:Model = new Model();			
			scenario = new Scenario(mdl);						
			ai.container.addChild(scenario);
			ai.container.messageLabel.visible = false;
			var ctrl:ScenarioController = new ScenarioController(mdl, scenario);
			ai.container.addChild(new Borda());
			
		}
		
		private function fazerTutorial():void {
		 
		tut.adicionarBalao("texto 1", new Point(50, 50), CaixaTexto.CENTER, CaixaTexto.BOTTOM);
		tut.adicionarBalao("texto 2", new Point(150, 150), CaixaTexto.CENTER, CaixaTexto.BOTTOM);
		}
		
		
		/* INTERFACE cepa.AIObserver */
		
		public function onResetClick() 
		{
			ai.container.removeChild(scenario);
			startLO();
		}
		
		public function onScormFetch() 
		{
			
		}
		
		public function onScormSave() 
		{
			
		}
		
		public function onTutorialClick() 
		{

		tut.iniciar(stage);
		 
		}
		
	}
	
}