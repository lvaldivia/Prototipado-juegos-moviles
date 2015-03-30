package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.loader.XXXLoader;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends Sprite 
	{
		private var circle:Sprite;
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//var game:Game1 = new Game1();
			//addChild(game);
			
			var loader:XXXLoader = new XXXLoader("assets.swf",startGame);
		}
		
		private function startGame():void 
		{
			var c:Class = Global.assets.getDefinition("hero") as Class;
			var mc:MovieClip = new c();
			mc.x = 100;
			mc.y = 50;
			addChild(mc);
			
			//trace();
		}
		
	}
	
}