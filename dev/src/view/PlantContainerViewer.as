package view 
{
	import com.eclecticdesignstudio.motion.Actuate;
	import com.eclecticdesignstudio.motion.easing.Elastic;
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
		private var laststatus:Boolean = false;
		private var simbok:SimbOk = new SimbOk();
		
		public function PlantContainerViewer(plant:Plant) 
		{
			this.plant = plant;
			addChild(simbok);
			simbok.scaleX = 0.01;
			simbok.scaleY = 0.01;
			simbok.alpha = 0.01;
			simbok.x = this.width - 12;
			simbok.y += 6;
			
		}
		
		public function onPlantStateChanged(ev:PlantEvent):void {
			if (ev.plant.correct && ev.plant==plant) {
				if (!laststatus) {
					laststatus = ev.plant.correct;
					showSimbok();
				}
			}
		}
		
		private function showSimbok() {
			simbok.alpha = 1;
			Actuate.tween(simbok, 0.7, { scaleX:1, scaleY:1 } ).ease(Elastic.easeInOut);
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