package Utils.states
{
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class DState extends Sprite
	{
		protected var skin:Image;
		protected var clip:String;
		protected var hasLoop:Boolean;
		
		public function DState(_clip:String = "", _loop:Boolean = true)
		{
			clip = _clip;
			hasLoop = _loop;
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			init();
			if (hasLoop)
			{
				stage.addEventListener(Event.ENTER_FRAME, loop);
			}
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function loop(e:Event):void 
		{
			update();
		}
		
		public function update():void 
		{
			
		}
		
		private function removed(e:Event):void
		{
			if (hasLoop) {
				stage.removeEventListener(Event.ENTER_FRAME, loop);
			}
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
		}
		
		public function destroy():void
		{
			removeChildren();
		}
		
		public function init():void
		{
			if (clip !== '')
			{
				skin = new Image(DStarling.assetsManager.getTexture(clip));
				addChild(skin);
			}
			else
			{
				var quad:Quad = new Quad(stage.stageWidth, stage.stageHeight, 0x00FF00);
				addChild(quad);
			}
		
		}
	
	}

}