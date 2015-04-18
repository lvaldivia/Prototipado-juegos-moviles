package xxx.objects 
{
	import starling.core.Starling;
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
		protected var skin:Image;
		protected var animations:MovieClip;
		protected var position:Vector2D;
		protected var acceleration:Vector2D;
		protected var velocity:Vector2D;
		
		public function Entity() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			init();
		}
		
		public function update():void {
			if (position != null) {
				x = position.x;
				y = position.y;
			}
		}
		
		public function init():void 
		{
			if (skin != null) {
				addChild(skin);
			}
			if (animations!=null) {
				addChild(animations);
				Starling.juggler.add(animations);
			}
			if (position != null) {
				x = position.x;
				y = position.y;
			}
		}
		
		public function destroy():void {
			while (numChildren > 0) {
				removeChildAt(0);
			}
		}
		
	}

}