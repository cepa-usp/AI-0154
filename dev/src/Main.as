package 
{
	import controller.ScenarioController;
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
<<<<<<< HEAD
			
			fazerTutorial();			
			ai = new AI(this);
			ai.addObserver(this)
			startLO();

			tut.iniciar(stage);
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
		 
			tut.adicionarBalao("Este cenário é composto por regiões com diferentes características: umidade, luz e sombra, relevo etc.", new Point(stage.stageWidth/2, stage.stageHeight/2), -1, -1);
			tut.adicionarBalao("Passe o mouse sobre uma planta para ver dicas que lhe ajudarão a identificá-la.", new Point(270, 610), CaixaTexto.BOTTOM, CaixaTexto.LAST);
			tut.adicionarBalao("Arraste uma planta para o cenário, na região que você julgar mais propícia a ela.", new Point(350, 610), CaixaTexto.BOTTOM, CaixaTexto.FIRST);
			tut.adicionarBalao("Se a sua escolha for acertada, a planta permanecerá no cenário; se não, ela morrerá.", new Point(150, 150), -1, -1);
			tut.adicionarBalao("Este é o número de espécimes disponíveis (ou, o número de tentativas que você tem).", new Point(310, 670), CaixaTexto.BOTTOM, CaixaTexto.CENTER);
		
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
=======
			var mdl:Model = new Model();
			var scenario:Scenario = new Scenario(mdl);			
			addChild(scenario);
			var ctrl:ScenarioController = new ScenarioController(mdl, scenario);
>>>>>>> 21a8774f4c33cdc57be6a5c84878fa7e56182d18
			
		}
		
	}
	
}