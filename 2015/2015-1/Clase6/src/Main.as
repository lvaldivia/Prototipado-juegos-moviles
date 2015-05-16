package
{	
	
	import flash.display.Sprite;
	import starling.events.Event;
	import views.manageView;
	import xxx.start.XXXStarling;

	
	/**
	 * ...
	 * @author Luis
	 */
	
	 [SWF(width="640", height="960", frameRate="60", backgroundColor="#000000")]
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
			assets.push("assets/background.png",
			"assets/start_button.png",
			"assets/stop_button.png",
			"assets/palitos.png",
			"assets/palitos.xml");
			
			XXXStarling.init(stage, manageView, assets, goGame);
		}
		
		private function goGame(game:Object):void 
		{
			Global.assets = XXXStarling.assetManager;
			game.start();
		}
		
	}
	
}