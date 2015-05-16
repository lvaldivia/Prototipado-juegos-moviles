package xxx.objects 
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import xxx.Math.Vector2D;
	/**
	 * ...
	 * @author Luis
	 */
	public class Entity extends Sprite
	{
		protected var textures:Vector.<Texture>;
		protected var _position:Vector2D;
		protected var acceleration:Vector2D;
		protected var velocity:Vector2D;
		protected var centerPivot:Boolean;
		protected var _outOfBounds:Boolean;
		
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
			if (textures.length) {
				var mc:MovieClip = new MovieClip(textures);
				if (centerPivot) {
					mc.alignPivot();
				}
				addChild(mc);
				Starling.juggler.add(mc);
			}else {
				var img:Image= new Image(textures[0]);
				addChild(img);
				if (centerPivot) {
					img.alignPivot();
				}
			}
			if(position!=null){
				x = position.x;
				y = position.y;
			}
			acceleration = new Vector2D(0, 0);
			velocity = new Vector2D(0, 0);
		}
		
		public function destroy():void {
			while (numChildren > 0) {
				removeChildAt(0);
			}
		}
		
		public function hit(ent1:Entity):Boolean {
			var distance:Number = Vector2D.sqtr(position, ent1.position);
			var radius1:Number = width / 2;
			var radius2:Number = ent1.width / 2;
			if (distance < radius1 + radius2) {
				return true;
			}
			return false;
		}
		
		public function get outOfBounds():Boolean 
		{
			return _outOfBounds;
		}
		
		public function set outOfBounds(value:Boolean):void 
		{
			_outOfBounds = value;
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