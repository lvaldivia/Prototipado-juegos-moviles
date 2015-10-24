package Utils.input 
{
	import flash.ui.Keyboard;
	import starling.display.Stage;
	import starling.events.KeyboardEvent;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DKeyboard 
	{
		public static var stage:Stage;
		public static var leftPress:Boolean;
		public static var rightPress:Boolean;
		public static var upPress:Boolean;
		public static var downPress:Boolean;
		public static function init(_stage:Stage):void
		{
			stage = _stage;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}

		
		private static function keyDown(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					leftPress = true;
				break;
				case Keyboard.RIGHT:
					rightPress = true;
				break;
				case Keyboard.UP:
					upPress = true;
				break;
				case Keyboard.DOWN:
					downPress = true;
				break;
			}
		}
		
		private static function keyUp(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					leftPress = false;
				break;
				case Keyboard.RIGHT:
					rightPress = false;
				break;
				case Keyboard.UP:
					upPress = false;
				break;
				case Keyboard.DOWN:
					downPress = false;
				break;
			}
		}
		
	}

}