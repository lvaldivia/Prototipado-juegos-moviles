package 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import Utils.start.DStarling;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite
	{
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		public function start():void {
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			var bg:Image = new Image(DStarling.assetsManager.getTexture("scene1"));
			addChild(bg);
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			var mc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk00"));
			addChild(mc);
			mc.x = Math.random() * stage.stageWidth;
			mc.y = Math.random() * stage.stageHeight;
			Starling.juggler.add(mc);
			mc.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			var mc:MovieClip = e.currentTarget as MovieClip;
			var touch:Touch = e.getTouch(mc);
			if (touch != null) {
				if (touch.phase == TouchPhase.BEGAN) {
					removeChild(mc);
					Starling.juggler.remove(mc);
					mc.removeEventListener(TouchEvent.TOUCH, onTouch);
				}
			}
		}
		
		
		
		
	}

}