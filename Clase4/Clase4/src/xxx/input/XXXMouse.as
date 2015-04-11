package xxx.input 
{
	import starling.display.Stage;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * ...
	 * @author Luis
	 */
	public class XXXMouse 
	{
		static private var stage:Stage;
		static public var x:Number;
		static public var y:Number;
		static public function init(_stage:Stage):void {
			stage = _stage;
			stage.addEventListener(TouchEvent.TOUCH, oTouch);
		}
		
		static private function oTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(stage);
			if (touch) {
				if (touch.phase == TouchPhase.HOVER) {
					x = touch.globalX;
					y = touch.globalY;
				}
			}
		}
		
	}

}