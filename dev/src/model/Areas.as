package model 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Arthur Tofani
	 */
	public class Areas 
	{
		public static const RelevoSombra:Area = new Area("Relevo com sombra", [[0, 2], new Rectangle(0, 3, 2, 4)], 0x11710F);
		public static const PlanoIluminado:Area = new Area("Plano iluminado", [[4, 5], [4, 6], new Rectangle(2, 3, 2, 4)], 0x85E0D7);
		public static const MediaSombra:Area = new Area("Média sombra", [new Rectangle(4, 4, 4, 1), new Rectangle(5, 5, 1, 1)], 0x8B0DF2);
		public static const MorroMataVerde:Area = new Area("Morro (mata verde)", [new Rectangle(4, 1, 3, 3),], 0x17E885);
		public static const Floresta:Area = new Area("Foresta", [new Rectangle(6, 6, 5,3), [5, 8]], 0x17E885);
		
		public function Areas() 
		{
			
		}
		
		
		
	}

}