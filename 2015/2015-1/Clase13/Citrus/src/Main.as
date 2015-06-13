package
{
	import citrus.core.starling.StarlingCitrusEngine;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends StarlingCitrusEngine 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			state = new Game();
		}
		
	}
	
}