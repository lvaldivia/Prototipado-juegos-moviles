package 
{
	import flash.utils.setTimeout;
	import gameObjects.Hero;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXKeyboard;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class manageView extends Sprite 
	{
		private var hero:Hero;
		
		public function manageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		public function start():void {
			hero = new Hero();
			addChild(hero);
			XXXKeyboard.init(stage);
			setTimeout(remove, 2000);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function remove():void 
		{
			removeChild(hero);
		}
		
		private function loop(e:Event):void 
		{
			hero.update();
		}
		
	}

}