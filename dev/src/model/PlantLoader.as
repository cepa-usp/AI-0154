package model 
{
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Arthur
	 */
	public class PlantLoader 
	{
		private static var _instance:PlantLoader = new PlantLoader();
		private var terrain:Dictionary;
		public static var amtnInstances:int = 3;
		public function PlantLoader() 
		{
			terrain = new Dictionary();
			createTerrain();
			if( _instance ) throw new Error( "PlantLoader can only be accessed through PlantLoader.getInstance()" ); 
		}
		
		public function createTerrain() {
			var t1:Array = [
				new Rectangle(0, 0, 4, 4),
				new Rectangle(0, 0, 4, 4),
			];
			terrain["floresta"] = t1;
		}
		
		public function load(mdl:Model):void {
			var p_1:Plant = new Plant(1, mdl);
			p_1.hints.push("Sou uma “briófita” do tipo hepática. Ocorro em ambientes úmidos e sombreados, crescendo em agrupamentos para garantir certa umidade.");
			p_1.hints.push("Como toda “briófita”, dependo muito da água e as gotas de chuva facilitam a dispersão dos meus anterozoides que são flagelados.");
			p_1.hints.push("Sou avascular e o gametófito é minha fase duradoura. A absorção de água e nutrientes é realizada por toda a minha superfície e a condução é feita célula a célula.");
			p_1.hints.push("Sou de tamanho pequeno e inconspícuo, com corpo majoritariamente do tipo taloso, mas temos representantes folhosos.");
			p_1.hints.push("Sou uma planta terrestre, mas não possuo todas as adaptações necessárias para ocupar ambientes secos ou ensolarados e só algumas de nós possuem poros, portanto, não podemos regular muito a perda de água por evaporação e transpiração.");
			p_1.name = "Hepática";
			p_1.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_1);
			mdl.environment.setRegionsForPlant(1, new Rectangle(0, 0, 10, 10));
			mdl.environment.setRegionsForPlant(1, new Rectangle(22, 16, 4, 6));
			
			var p_2:Plant = new Plant(2, mdl);
			p_2.hints.push("Nós antóceros somos um pequeno grupo de representantes de “briófitas”. Nosso gametófito taloso é a fase dominante e geralmente forma uma roseta muito delicada.");
			p_2.hints.push("Carecemos de células condutoras especializadas e preferimos crescer em brejos bastante úmidos e sombreados.");
			p_2.hints.push("Nosso talo gametofítico é muito mais delicado que hepáticas e musgos, possui poucas células de espessura e desidrata facilmente quando exposto diretamente ao sol.");
			p_2.hints.push("Nosso esporófito é fotossintetizante e de crescimento contínuo. Também é recoberto por cutícula e temos estômatos.");
			p_2.hints.push("Apesar de termos estômatos no esporófito, eles são considerados não funcionais porque não são capazes de regular sua abertura e fechamento, funcionando como um poro.");
			p_2.name = "Antóceros";
			p_2.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_2);			
			mdl.environment.setRegionsForPlant(2, new Rectangle(50, 0, 20, 20));
			mdl.environment.setRegionsForPlant(2, new Rectangle(0, 0, 10, 10));	
			
			var p_3:Plant = new Plant(3, mdl);
			p_3.hints.push("Dentre as “briófitas” eu sou a mais adaptada às condições terrestres e, por isso, posso crescer em ambientes um pouco mais ensolarados.");
			p_3.hints.push("Sou um musgo e meu corpo é folhoso, com distinção entre rizoides, cauloides e filoides.");
			p_3.hints.push("Assim como outras “briófitas”, nossos anterozoides são flagelados e sua liberação está associada a pingos de chuva que facilitam sua dispersão e auxiliam na fecundação da oosfera.");
			p_3.hints.push("Meu gametófito dominante tem estômatos com capacidade de controlar sua abertura e fechamento. Algumas de nós possuem células especializadas de condução, leptoides e hidroides.");
			p_3.hints.push("Formamos densos tapetes e dependemos fortemente da água. Mas graças às nossas adaptações podemos ocorrer em superfícies mais expostas ao sol, como, por exemplo, rochas.");
			p_3.name = "Musgos";
			p_3.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_3);			
			mdl.environment.setRegionsForPlant(3, new Rectangle(50, 0, 20, 20));
			
			
			var p_4:Plant = new Plant(4, mdl);
			p_4.hints.push("Sou uma samambaia, uma “pteridófita”, uma planta terrestre vascular sem sementes.");
			p_4.hints.push("Nós não temos sementes, portanto, nosso embrião é susceptível aos rigores da vida na terra e, por isso, preferimos ambientes ainda úmidos e sombreados, mas também posso crescer em locais com mais sol.");
			p_4.hints.push("Minha fase dominante é a esporofítica e essa inovação evolutiva me favoreceu para ter maior independência de ambientes úmidos.");
			p_4.hints.push("Assim como toda planta vascular com xilema e floema e graças aos meristemas apicais, podemos atingir tamanhos maiores e nos ramificar para competir pela energia solar e fazer fotossíntese.");
			p_4.hints.push("Nossos anterozoides são flagelados, portanto, precisamos da água para que eles nadem e alcancem a oosfera.");
			p_4.name = "Samambaia";
			p_4.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_4);			
			mdl.environment.setRegionsForPlant(4, new Rectangle(50, 0, 20, 20));
			
			
			var p_5:Plant = new Plant(5, mdl);
			p_5.hints.push("Sou uma planta vascular do tipo espermatófita, portanto tenho semente. Porém, minha semente é nua, diferente das angiospermas.");
			p_5.hints.push("Minha grande inovação evolutiva, a semente, me possibilita sobreviver em vários tipos de ambientes, com maior grau de independência da água.");
			p_5.hints.push("Sou uma “gimnosperma” e a água não é mais necessária para que o gameta masculino alcance a oosfera. Nossa fecundação é auxiliada pela polinização e a formação de um tubo polínico.");
			p_5.hints.push("As coníferas são um tipo de “gimnosperma” que dominam muitas comunidades vegetais. Geralmente ocorrem em ambientes de climas temperados a frios.");
			p_5.name = "Gimnosperma";
			p_5.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_5);			
			mdl.environment.setRegionsForPlant(5, new Rectangle(50, 0, 20, 20));
			mdl.environment.setRegionsForPlant(5, new Rectangle(0, 0, 10, 10));				
			
			
			var p_6:Plant = new Plant(6, mdl);
			p_6.hints.push("Sou uma angiosperma, uma espermatófita com sementes protegidas pelo fruto, que se desenvolve graças à presença de flor.");
			p_6.hints.push("Somos as plantas dominantes e mais diversas de Archaeplastida e podemos crescer em todo tipo de ambiente terrestre.");
			p_6.hints.push("Assim como as “gimnospermas” podemos alcançar grandes alturas, mas também temos representantes de uns poucos centímetros.");
			p_6.hints.push("Na nossa fecundação também participa o tubo polínico, permitindo-nos independência da água para a reprodução.");
			p_6.name = "Angiosperma";
			p_6.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_6);			
			mdl.environment.setRegionsForPlant(6, new Rectangle(50, 0, 20, 20));

			var p_7:Plant = new Plant(7, mdl);
			p_7.hints.push("Sou uma planta vascular do tipo espermatófita, portanto tenho semente. Porém, minha semente é nua, diferente das angiospermas.");
			p_7.hints.push("Minha grande inovação evolutiva, a semente, me possibilita sobreviver em vários tipos de ambientes, com maior grau de independência da água.");
			p_7.hints.push("Sou uma “gimnosperma” e a água não é mais necessária para que o gameta masculino alcance a oosfera. Nossa fecundação é auxiliada pela polinização e a formação de um tubo polínico.");
			p_7.hints.push("As coníferas são um tipo de “gimnosperma” que dominam muitas comunidades vegetais. Geralmente ocorrem em ambientes de climas temperados a frios.");
			p_7.name = "Gimnosperma 2";
			p_7.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_7);			
			mdl.environment.setRegionsForPlant(7, new Rectangle(50, 0, 20, 20));
			mdl.environment.setRegionsForPlant(7, new Rectangle(0, 0, 10, 10));				
			
			
			var p_8:Plant = new Plant(8, mdl);
			p_8.hints.push("Sou uma angiosperma, uma espermatófita com sementes protegidas pelo fruto, que se desenvolve graças à presença de flor.");
			p_8.hints.push("Somos as plantas dominantes e mais diversas de Archaeplastida e podemos crescer em todo tipo de ambiente terrestre.");
			p_8.hints.push("Assim como as “gimnospermas” podemos alcançar grandes alturas, mas também temos representantes de uns poucos centímetros.");
			p_8.hints.push("Na nossa fecundação também participa o tubo polínico, permitindo-nos independência da água para a reprodução.");
			p_8.name = "Angiosperma 2";
			p_8.createInstances(amtnInstances, mdl.environment);			
			mdl.plants.push(p_8);			
			mdl.environment.setRegionsForPlant(8, new Rectangle(50, 0, 20, 20));			
			
		}
		
		public static function getInstance():PlantLoader
		{
			return _instance;
		}
		
		
	}

}