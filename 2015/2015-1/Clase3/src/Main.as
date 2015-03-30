package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.loader.XXXLoader;
	
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
			XXXLoader.load("assets.swf", goGame);
		}
		
		private function goGame():void 
		{
			trace("creo game");
			var game:Game = new Game();
			addChild(game);
		}
		
	}
	
}