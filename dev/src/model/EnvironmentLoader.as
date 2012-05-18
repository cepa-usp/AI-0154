package model 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Arthur
	 */
	public class EnvironmentLoader 
	{
		private static var _instance:EnvironmentLoader = new EnvironmentLoader();
		public function EnvironmentLoader() 
		{
			if( _instance ) throw new Error( "PlantLoader can only be accessed through EnvironmentLoader.getInstance()" ); 
		}

		
		
		public function load(mdl:Model):void {
			var env:Enviro = new Enviro(70, 50);
			mdl.environment = env;
			
		}
		
		public static function getInstance():EnvironmentLoader 
		{
			return _instance;
		}
				
	}

}