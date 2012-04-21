package model 
{
	/**
	 * ...
	 * @author Arthur
	 */
	public class PlantLoader 
	{
		private static var _instance:PlantLoader = new PlantLoader();
		public function PlantLoader() 
		{
			if( _instance ) throw new Error( "PlantLoader can only be accessed through PlantLoader.getInstance()" ); 
		}
		
		public function load(mdl:Model) {
			var p_1:Plant = new Plant("planta1");
			p_1.hints.push("Dica 1");
			p_1.hints.push("Dica 2");
			p_1.hints.push("Dica 3");
			p_1.hints.push("Dica 4");
			p_1.hints.push("Dica 5");
			p_1.name = "Planctis primum";
			p_1.createInstances();
			
			mdl.plants.push(p_1);
			
		}
		
		public static function getInstance():PlantLoader
		{
			return _instance;
		}
		
		
	}

}