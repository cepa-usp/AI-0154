package model 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Arthur
	 */
	public class PlantLoader 
	{
		private static var _instance:PlantLoader = new PlantLoader();
		public static var amtnInstances:int = 5;
		public function PlantLoader() 
		{
			if( _instance ) throw new Error( "PlantLoader can only be accessed through PlantLoader.getInstance()" ); 
		}
		
		public function load(mdl:Model) {
			var p_1:Plant = new Plant(1, mdl);
			p_1.hints.push("Dica 1");
			p_1.hints.push("Dica 2");
			p_1.hints.push("Dica 3");
			p_1.hints.push("Dica 4");
			p_1.hints.push("Dica 5");
			p_1.name = "Planctis primum";
			p_1.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_1);
			mdl.environment.setRegionsForPlant(1, new Rectangle(0, 0, 10, 10));
			mdl.environment.setRegionsForPlant(1, new Rectangle(22, 16, 4, 6));
			
			var p_2:Plant = new Plant(2, mdl);
			p_2.hints.push("Dica 1");
			p_2.hints.push("Dica 2");
			p_2.hints.push("Dica 3");
			p_2.hints.push("Dica 4");
			p_2.hints.push("Dica 5");
			p_2.name = "Planctis secundum";
			p_2.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_2);			
			
		}
		
		public static function getInstance():PlantLoader
		{
			return _instance;
		}
		
		
	}

}