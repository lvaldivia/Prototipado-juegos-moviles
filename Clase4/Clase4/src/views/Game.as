package views 
{
	import flash.utils.Dictionary;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXKeyboard;
	import xxx.input.XXXMouse;
	
	/**
	 * ...
	 * @author Luis
	 */
	public class Game extends Sprite 
	{
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			XXXKeyboard.init(stage);
			XXXMouse.init(stage);
		}
		
		public function start():void 
		{
			stage.addEventListener(Event.ENTER_FRAME, loop);
			
		}
		
		private function loop(e:Event):void 
		{
			
		}
		
	}

}