package Utils.start 
{
	import flash.display.Stage;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.utils.AssetManager;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DStarling 
	{
		private static var starling:Starling;
		private static var _assetsManager:AssetManager;
		private static var _assets:Vector.<String>;
		private static var _stage:Stage;
		private static var baseClass:Class;
		
		public static function init(rootClas:Class, stage:Stage,
									assets:Vector.<String>):void {
			baseClass = rootClas;
			_stage = stage;
			var stageSize:Rectangle  = new Rectangle(0, 0, _stage.stageWidth, _stage.stageHeight);
            var screenSize:Rectangle = new Rectangle(0, 0, _stage.fullScreenWidth, _stage.fullScreenHeight);
            var viewPort:Rectangle = RectangleUtil.fit(stageSize, screenSize, ScaleMode.SHOW_ALL);
			starling = new Starling(rootClas, _stage,viewPort,null,"auto","auto");
			starling.start();
			assetsManager = new AssetManager();
			_assets = assets;
			starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
		}
		
		static private function onRootCreated(e:Event):void 
		{
			starling.removeEventListener(Event.ROOT_CREATED, onRootCreated);
			var file:File = File.applicationDirectory;
			for (var i:int = 0; i < _assets.length; i++) 
			{
				assetsManager.enqueue(file.resolvePath(_assets[i]));
			}
			assetsManager.loadQueue(endQueue);
		}
				
		static private function endQueue(ratio:Number):void 
		{
			if (ratio == 1) {
				var game:Object  = starling.root as baseClass;
				game.start();
			}
		}
		
		static public function get assetsManager():AssetManager 
		{
			return _assetsManager;
		}
		
		static public function set assetsManager(value:AssetManager):void 
		{
			_assetsManager = value;
		}
		
	}

}