package XXXNoScope360HeadShot.inputs 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author ISIL
	 */
	public class XXXMouse 
	{
		static public var clickObj:Sprite;
		static public function init(stage:Stage,config:Dictionary=null):void {
			stage.addEventListener(MouseEvent.CLICK, click);
			clickObj = new Sprite();
			if (config != null) {
				if (config['activate_down']) {
					stage.addEventListener(MouseEvent.MOUSE_DOWN, down);
					stage.addEventListener(MouseEvent.MOUSE_UP, up);
				}
			}
			
		}
		static public function clear():void {
			clickObj = null;
		}
		
		static private function click(e:MouseEvent):void 
		{
			clickObj = e.target as Sprite;
		}
		
		static private function up(e:MouseEvent):void 
		{
			
		}
		
		static private function down(e:MouseEvent):void 
		{
			
		}
		
	}

}