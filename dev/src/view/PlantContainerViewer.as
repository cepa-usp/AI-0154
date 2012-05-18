package view 
{
	import com.eclecticdesignstudio.motion.Actuate;
	import model.Plant;
	import model.PlantEvent;
	import model.PlantInstance;
	/**
	 * ...
	 * @author Arthur Tofani
	 */
	public class PlantContainerViewer extends PlantContainer 
	{
		
		private var _plant:Plant;
		private var _enabled:Boolean = true;
		public function PlantContainerViewer(plant:Plant) 
		{
			this.plant = plant;
		}
		
		
		public function onInstanceChanged(e:PlantEvent):void 
		{			
			
			var pl:Plant = e.plant;			
			if(pl==plant){
				var v:int = plant.getAvailableInstances();
				this.txQtde.text = String(v);
				if (v <= 0) {
					enabled = false;
					Actuate.tween(this.pictureContainer, 1, { alpha:0.4 } );
				}
			}
		}
		
		public function get plant():Plant 
		{
			return _plant;
		}
		
		public function set plant(value:Plant):void 
		{
			_plant = value;
		}
		
		public function get getEnabled():Boolean 
		{
			return _enabled;
		}
		
		public function set setEnabled(value:Boolean):void 
		{
			_enabled = value;
		}
		
	}

}