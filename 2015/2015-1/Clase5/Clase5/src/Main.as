package
{
	import starling.core.Starling;
	import starling.events.Event;
	import flash.display.Sprite;
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author ISIL
	 */
	
	[SWF(width="640", height="960", frameRate="60", backgroundColor="#000000")]
	public class Main extends Sprite 
	{
		private var starling:Starling;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Starling.handleLostContext = true;
			starling = new Starling(manageView, stage);
			starling.start();
			starling.addEventListener(Event.ROOT_CREATED, onCreated);
		}
		
		private function onCreated(e:Event):void 
		{
			Global.assetManager = new AssetManager();
			Global.assetManager.enqueue("assets/background.png");
			Global.assetManager.enqueue("assets/start_button.png");
			Global.assetManager.enqueue("assets/stop_button.png");
			Global.assetManager.enqueue("assets/palitos.png");
			Global.assetManager.enqueue("assets/palitos.xml");
			Global.assetManager.loadQueue(load);
		}
		
		private function load(ratio:Number):void {
			if (ratio == 1) {
				var game:manageView = starling.root as manageView;
				game.start();
			}
		}
	}
	
}