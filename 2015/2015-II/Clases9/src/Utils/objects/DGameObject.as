package Utils.objects 
{
	import flash.utils.Dictionary;
	import starling.animation.Juggler;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import Utils.start.DStarling;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DGameObject extends Sprite
	{
		protected var textures:Vector.<Texture>;
		protected var states:Dictionary;
		protected var _alife:Boolean;
		protected var life:int;
		protected var currState:String;
		private var clip:String;
		private var centerPivot:Boolean;
		private var defaultLife:int;
		
		public function DGameObject(_clip:String, _centerPivot:Boolean = true,
										_life:int = 100,_alife:Boolean=true) 
		{
			defaultLife = _life;
			clip = _clip;
			centerPivot = _centerPivot;
			alife = _alife;
			life = _life;
			states = new Dictionary();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		public function addState(key:String,_textures:Vector.<Texture>):void {
			states[key] = _textures;
		}
		
		public function startState(_state:String):void {
			if (currState == _state) { return; }
			if (getChildAt(0) is MovieClip) {
				MovieClip(getChildAt(0)).stop();
				Starling.juggler.remove(MovieClip(getChildAt(0)));
			}
			removeChildAt(0);
			var texture:Vector.<Texture> = states[_state];
			if (texture.length == 1) {
				var skinImg:Image = new Image(texture[0]);
				addChild(skinImg);
			}else {
				var skinMc:MovieClip = new MovieClip(texture);
				Starling.juggler.add(skinMc);
				addChild(skinMc);
			}
			currState = _state;
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			init();
		}
		
		public function update():void {
			if(numChildren>0){
				if (getChildAt(0) is MovieClip) {
					if ( MovieClip(getChildAt(0)).currentFrame == 
							MovieClip(getChildAt(0)).numFrames - 1   ) {
						onCompleteAnim();
					}
				}
			}
		}
		
		public function onCompleteAnim():void 
		{
			
		}
		
		public function init():void {
			if (centerPivot) {
				alignPivot();
			}
			textures = DStarling.assetsManager.getTextures(clip);
			if (textures.length == 1) {
				var skinImg:Image = new Image(textures[0]);
				addChild(skinImg);
			}else {
				var skinMc:MovieClip = new MovieClip(textures);
				Starling.juggler.add(skinMc);
				addChild(skinMc);
			}
		}
		
		public function reset(_x:Number=0,_y:Number=0):void{
			x = _x;
			y = _y;
			alife = true;
			visible = true;
			unflatten();
			life = defaultLife;
		}
		
		public function kill():void{
			alife = false;
			visible = false;
			flatten();
		}
		
		public function hurt(damage:int):void{
			life-= damage;
			if(life<=0){
				kill();
			}
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
		}
		
		private function destroy():void 
		{
			removeChildren();
		}
		
		public function get alife():Boolean 
		{
			return _alife;
		}
		
		public function set alife(value:Boolean):void 
		{
			_alife = value;
		}
		
	}

}