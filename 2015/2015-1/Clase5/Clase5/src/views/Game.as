package views 
{
	import gameObjects.Hero;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXMouse;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite 
	{
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			XXXMouse.init(stage);
			var bg:Image = new Image(Global.assetManager.getTexture("background"));
			addChild(bg);
			var hero:Hero = new Hero();
			addChild(hero);
		}
		
	}

}