package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.inputs.XXXKeyboard;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite 
	{
		private var hero:Hero;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			hero = new Hero();
			addChild(hero);
			XXXKeyboard.init(stage);
			stage.addEventListener(Event.ENTER_FRAME, loop);
			var enemy:Enemy = new Enemy();
			addChild(enemy) ;
		}
		
		private function loop(e:Event):void 
		{
			hero.update();
		}
		
	}

}