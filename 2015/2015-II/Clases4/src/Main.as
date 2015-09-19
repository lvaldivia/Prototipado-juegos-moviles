package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Utils.start.DStarling;
	
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
			assets.push('graphics/bgWelcome.jpg');
			assets.push('graphics/bgLayer1.jpg');
			assets.push('graphics/mySpritesheet.png');
			assets.push('graphics/mySpritesheet.xml');
			DStarling.init(Game, stage, assets);
		}
		
	}
	
}