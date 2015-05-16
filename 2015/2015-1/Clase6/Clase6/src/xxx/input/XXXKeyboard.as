package xxx.input 
{
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	import starling.display.Stage;
	import starling.events.KeyboardEvent;
	/**
	 * ...
	 * @author Luis
	 */
	public class XXXKeyboard 
	{
		static private var stage:Stage;
		static public var leftPress:Boolean;
		static public var rightPress:Boolean;
		static public var upPress:Boolean;
		static public var downPress:Boolean;
		public static function init(_stage:Stage):void {
			stage = _stage;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, downKey);
			stage.addEventListener(KeyboardEvent.KEY_UP, upKey);
		}
		
		static private function upKey(e:KeyboardEvent):void 
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
		
		static private function downKey(e:KeyboardEvent):void 
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
		
		static public function destroy():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, downKey);
			stage.removeEventListener(KeyboardEvent.KEY_UP, upKey);
		}
		
	}

}