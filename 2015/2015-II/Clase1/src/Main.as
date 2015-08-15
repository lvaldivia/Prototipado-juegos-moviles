package
{
	import flash.display.NativeMenu;
	import flash.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author ISIL
	 */
	[SWF(frameRate=60)]
	public class Main extends Sprite 
	{
		private var asset:AssetManager;
		private var starling:Starling;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			starling = new Starling(Game, stage);
			starling.start();
			starling.showStats = true;
			starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
		}
		
		private function onRootCreated(e:Event):void 
		{
			asset = new AssetManager();
			asset.enqueue("assets/background.png");
			asset.enqueue("assets/animacion.png");
			asset.enqueue("assets/animacion.xml");
			asset.loadQueue(startGame);
		}
		
		private function startGame(ratio:Number):void 
		{
			trace("% " + ratio);
			if (ratio == 1) {
				var game:Game = starling.root as Game;
				game.start(asset);
			}
			
		}
		
	}
	
}