package xxx.start 
{
	
	import flash.display.Stage;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.utils.AssetManager;

	/**
	 * ...
	 * @author Yorsh
	 */
	public class XXXStarling
	{
		static private var starling:Starling;
		static private var onComplete:Function;
		static private var assets:Vector.<String>;
		static public var assetManager:AssetManager;
		static private var sClass:Class;
				
		public static function init(_stage:Stage, startClas:Class,_assets:Vector.<String>, _onComplete:Function):void {
			onComplete = _onComplete;
			sClass = startClas;
			assets = _assets;
			Starling.handleLostContext = true;
			starling = new Starling(startClas, _stage);
			starling.start() ;
			assetManager = new AssetManager();
			starling.addEventListener(Event.ROOT_CREATED, onCreated);
		}
		
		static private function onCreated(e:Event):void 
		{
			starling.removeEventListener(Event.ROOT_CREATED, onCreated);
			for (var i:int = 0; i < assets.length; i++) 
			{
				assetManager.enqueue(assets[i]);
			}
			assetManager.loadQueue(load);
		}
		
		static private function load(ratio:Number):void {
			if (ratio == 1) {
				var game:Object = starling.root as sClass;
				onComplete(game);
			}
		}
		
	}

}