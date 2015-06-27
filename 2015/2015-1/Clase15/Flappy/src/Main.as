package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import xxx.start.XXXStarling;
	
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
			var assets:Vector.<String> = new Vector.<String>();
			assets.push("assets/sprites.png");
			assets.push("assets/sprites.xml");
			XXXStarling.init(stage, manageView, assets, goGame);
		}
		
		private function goGame(game:Object):void 
		{
			game.start();
		}
		
	}
	
}