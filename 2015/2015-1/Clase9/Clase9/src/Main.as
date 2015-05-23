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
			assets.push("assets/states.png","assets/states.xml");
			XXXStarling.init(stage, manageView, assets, onComplete);
		}
		
		private function onComplete(game:manageView):void 
		{
			game.start();
		}
		
	}
	
}