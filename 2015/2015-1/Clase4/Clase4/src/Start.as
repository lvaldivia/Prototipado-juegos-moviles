package 
{
	import flash.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.utils.AssetManager;
	/**
	 * ...
	 * @author ISIL
	 */
	[SWF(width="640",height="960",frameRate="60")]
	public class Start extends Sprite
	{
		private var starling:Starling;
		
		public function Start() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			starling = new Starling(ManageView, stage);
			starling.start();
			starling.showStats = true;
			starling.addEventListener(Event.ROOT_CREATED, created);
		}
		
		private function created(e:Event):void 
		{
			starling.removeEventListener(Event.ROOT_CREATED, created);
			Global.assetsManager = new AssetManager();
			Global.assetsManager.enqueue("../assets/background.png");
			Global.assetsManager.enqueue("../assets/palitos.xml");
			Global.assetsManager.enqueue("../assets/palitos.png");
			Global.assetsManager.loadQueue(function(ratio:Number):void {
				if (ratio == 1) {
					var game:ManageView = starling.root as ManageView;
					game.start();
				}
			});
		}

		
	}

}