package
{
	import flash.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import views.Game;
	
	/**
	 * ...
	 * @author Luis
	 */
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
			starling = new Starling(Game, this.stage);
			starling.start();
			starling.addEventListener(Event.ROOT_CREATED, created);
		}
		
		private function created(e:Event):void 
		{
			starling.removeEventListener(Event.ROOT_CREATED, created);
			var game:Game = starling.root as Game;
			game.start();
		}
		
	}
	
}