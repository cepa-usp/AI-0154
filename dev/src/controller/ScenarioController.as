package controller 
{
	import flash.geom.Point;
	import model.Model;
	import model.Plant;
	import model.PlantInstance;
	import view.Scenario;
	import view.ScenarioEvent;
	/**
	 * ...
	 * @author Arthur Tofani
	 */
	public class ScenarioController 
	{
		private var mdl:Model;
		private var scenario:Scenario;
		public function ScenarioController(mdl:Model, scenario:Scenario) 
		{
			this.mdl = mdl;
			this.scenario = scenario;
			scenario.addEventListener(ScenarioEvent.PLANT_SEED, onPlantSeeded);
			scenario.addEventListener(ScenarioEvent.PLANT_FIXED, onPlantFixed);
			
		}
		
		private function onPlantFixed(e:ScenarioEvent):void 
		{
			var pi:PlantInstance = e.vars.instance;
			pi.evaluatePosition();
		}
		
		private function onPlantSeeded(e:ScenarioEvent):void 
		{
			var plant:Plant = e.vars.plant;
			var pos:Point = e.vars.position;
			plant.seedInstance(pos.x, pos.y);
			
		}
		
	}

}