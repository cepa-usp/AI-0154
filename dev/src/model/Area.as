package model 
{
	import flash.display.ColorCorrection;
	/**
	 * ...
	 * @author Arthur Tofani
	 */
	public class Area 
	{
		
		public var nome:String = "";
		public var areas:Array;
		public var cor:int = 0x008000;
		
		public function Area(nome:String, areas:Array, color:int) 
		{
			this.nome = nome;
			this.areas = areas;
			this.cor = color;
		}
		
	}

}