package xxx.objects 
{
	import flash.utils.Dictionary;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import xxx.Math.Vector2D;
	/**
	 * ...
	 * @author Yorsh
	 */
	public class Entity extends Sprite
	{
		protected var textures:Vector.<Texture>;
		protected var _position:Vector2D;
		protected var acceleration:Vector2D;
		protected var velocity:Vector2D;
		protected var centerPivot:Boolean;
		protected var _outOfBounds:Boolean;
		protected var states:Dictionary;
		protected var currentState:String;
		
		public function Entity() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			states = new Dictionary();
			init();
		}
		
		public function addState(name:String, _textures:Vector.<Texture>):void {
			states[name] = _textures;
		}
		
		public function changeState(name:String):void {
			if (currentState == name) { return; }
			if(getChildAt(0) is MovieClip){
				Starling.juggler.remove(MovieClip(getChildAt(0)));
			}
			removeChildAt(0);
			var _textures:Vector.<Texture> = states[name];
			if (_textures.length>1) {
				var mc:MovieClip = new MovieClip(_textures);
				if (centerPivot) {
					mc.alignPivot();
				}
				addChild(mc);
				Starling.juggler.add(mc);
			}else {
				var img:Image= new Image(_textures[0]);
				addChild(img);
				if (centerPivot) {
					img.alignPivot();
				}
			}
			currentState = name;
		}
		
		public function update():void {
			if(getChildAt(0) is MovieClip){
				if (MovieClip(getChildAt(0)).currentFrame == MovieClip(getChildAt(0)).numFrames-1) {
					onCompleteAnimation();
				}
			}
			
			if (position != null) {
				x = position.x;
				y = position.y;
			}
		}
		
		public function onCompleteAnimation():void 
		{
			
		}
		
		public function init():void 
		{
			if (textures.length>1) {
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
			for (var key:String in states) delete states[key];
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