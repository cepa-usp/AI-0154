package 
{
	import cepa.ai.AI;
	import cepa.ai.AIObserver;
	import cepa.tutorial.CaixaTextoNova;
	import cepa.tutorial.Tutorial;
	import cepa.utils.ToolTip;
	import controller.ScenarioController;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import model.Model;
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
			ai.container.setAboutScreen(new ScrAbout());
			ai.container.setInfoScreen(new ScrInstructions());
			createToolTips();
			tut.iniciar(stage);
		}
		
				/**
		 * Cria os tooltips nos botões
		 */
		private function createToolTips():void 
		{
			//var intTT:ToolTip = new ToolTip(ai.container.optionButtons.tutorialBtn, "Reiniciar tutorial", 12, 0.8, 150, 0.6, 0.1);
			//var instTT:ToolTip = new ToolTip(ai.container.optionButtons.orientacoesBtn, "Orientações", 12, 0.8, 100, 0.6, 0.1);
			//var resetTT:ToolTip = new ToolTip(ai.container.optionButtons.resetButton, "Reiniciar", 12, 0.8, 100, 0.6, 0.1);
			//var infoTT:ToolTip = new ToolTip(ai.container.optionButtons.creditos, "Créditos", 12, 0.8, 100, 0.6, 0.1);
			//
			//addChild(intTT);
			//addChild(instTT);
			//addChild(resetTT);
			//addChild(infoTT);
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
		 
			tut.adicionarBalao("Este cenário é composto por regiões com diferentes características: umidade, luz e sombra, relevo etc.", new Point(stage.stageWidth/2, stage.stageHeight/2), "", "");
			tut.adicionarBalao("Passe o mouse sobre uma planta para ver dicas que lhe ajudarão a identificá-la.", new Point(270, 610), CaixaTextoNova.BOTTOM, CaixaTextoNova.LAST);
			tut.adicionarBalao("Arraste uma planta para o cenário, na região que você julgar mais propícia a ela.", new Point(350, 610), CaixaTextoNova.BOTTOM, CaixaTextoNova.FIRST);
			tut.adicionarBalao("Se a sua escolha for acertada, a planta permanecerá no cenário; se não, ela morrerá.", new Point(150, 150), "", "");
			tut.adicionarBalao("Este é o número de espécimes disponíveis (ou, o número de tentativas que você tem).", new Point(310, 670), CaixaTextoNova.BOTTOM, CaixaTextoNova.CENTER);
		
		}
		
		/* INTERFACE cepa.ai.AIObserver */
		
		public function onResetClick():void 
		{
			ai.container.removeChild(scenario);
			startLO();
		}
		
		public function onScormFetch():void 
		{
			
		}
		
		public function onScormSave():void 
		{
			
		}
		
		public function onStatsClick():void 
		{
			
		}
		
		public function onTutorialClick():void 
		{
			tut.iniciar(stage);
		}
		
		public function onScormConnected():void 
		{
			
		}
		
		public function onScormConnectionError():void 
		{
			
		}
		
	}
	
}