package xxx.objects 
{
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.Math.Vector2D;
	/**
	 * ...
	 * @author Luis
	 */
	public class Entity extends Sprite
	{
		protected var position:Vector2D;
		protected var skin:Image;
		protected var animations:MovieClip;
		
		public function Entity() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			init();
		}
		
		private function init():void 
		{
			if (skin != null) {
				addChild(skin);
			}
			if (animations!=null) {
				addChild(animations);
			}
		}
		
		public function destroy():void {
			while (numChildren > 0) {
				removeChildAt(0);
			}
		}
		
	}

}