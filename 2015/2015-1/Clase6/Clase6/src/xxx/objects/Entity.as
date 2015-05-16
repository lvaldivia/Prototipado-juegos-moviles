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
		protected var _position:Vector2D;
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
		
		public function hit(objectHit:Entity):Boolean {
			var p1:Number = height / 2;
			var p2:Number = objectHit.height / 2;
			var distance:Number = Vector2D.distance(position, objectHit.position);
			var ret:Boolean = false;
			if (distance< p1+p2) {
				ret = true;
			}
			return ret;
		}
		
		public function destroy():void {
			while (numChildren > 0) {
				removeChildAt(0);
			}
		}
		
		public function get position():Vector2D 
		{
			return _position;
		}
		
		public function set position(value:Vector2D):void 
		{
			_position = value;
		}
		
	}

}