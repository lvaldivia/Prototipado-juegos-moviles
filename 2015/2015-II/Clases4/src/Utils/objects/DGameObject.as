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
		protected var alife:Boolean;
		protected var life:int;
		private var clip:String;
		public function DGameObject(_clip:String,_life:int = 100,_alife:Boolean=true) 
		{
			clip = _clip;
			alife = _alife;
			life = _life;
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			init();
		}
		
		public function init():void {
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
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
		}
		
		private function destroy():void 
		{
			removeChildren();
		}
		
	}

}