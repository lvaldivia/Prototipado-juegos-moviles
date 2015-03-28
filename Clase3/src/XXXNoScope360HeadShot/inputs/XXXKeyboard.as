package XXXNoScope360HeadShot.inputs
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class XXXKeyboard
	{
		static private var stage:Stage;
		static public var left_down:Boolean;
		static public var right_down:Boolean;
		static public var down_down:Boolean;
		static public var up_down:Boolean;
		
		static public function init(_stage:Stage):void
		{
			stage = _stage;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		static private function onKeyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT:
					left_down = true;
				break;
				case Keyboard.RIGHT:
					right_down = true;
				break;
				case Keyboard.DOWN:
					down_down = true;
				break;
				case Keyboard.UP:
					up_down = true;
				break;
			}
		}
		
		static private function onKeyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT:
					left_down = false;
				break;
				case Keyboard.RIGHT:
					right_down = false;
				break;
				case Keyboard.DOWN:
					down_down = false;
				break;
				case Keyboard.UP:
					up_down = false;
				break;
				
			}
		}
		
		static public function destroy():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
	
	}

}