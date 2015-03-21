package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var abc:Array = new Array( "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",  
					"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",  
					"U", "V", "W", "X", "Y", "Z");
			var search:int = 500;
			var total_letters:int = abc.length;
			var first_letter:int = search /total_letters ;
			var second_letter:int = (search - total_letters)%total_letters;
			trace("primera: "+first_letter, "segunda: "+second_letter);
			var combination:String = abc[first_letter - 1] + abc[second_letter - 1];
			trace("combinacion "+combination);
		}
		
	}
	
}