package view 
{
	import model.Plant;
	/**
	 * ...
	 * @author Arthur Tofani
	 */
	public class PlantContainerViewer extends PlantContainer 
	{
		
		private var _plant:Plant;
		public function PlantContainerViewer(plant:Plant) 
		{
			this.plant = plant;
		}
		
		public function get plant():Plant 
		{
			return _plant;
		}
		
		public function set plant(value:Plant):void 
		{
			_plant = value;
		}
		
	}

}