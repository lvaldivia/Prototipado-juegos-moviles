package 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import Utils.start.DStarling;
	import Utils.time.DTempo;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite
	{
		private var timer:Timer;
		private var monsters:int;
		private var elapsed:Number;
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		public function start():void {
			//timer = new Timer(1000);
			//timer.addEventListener(TimerEvent.TIMER, onTimer);
			//timer.start();
			stage.addEventListener(Event.ENTER_FRAME, loop);
			var bg:Image = new Image(DStarling.assetsManager.getTexture("scene1"));
			addChild(bg);
			stage.addEventListener(TouchEvent.TOUCH, onTouch);
			monsters  = 0;
			elapsed = 0;
			DTempo.init();
		}
		
		private function loop(e:Event):void 
		{
			DTempo.update();
			elapsed += DTempo.dt;
			if (elapsed >= 1) {
				elapsed = 0;
				if (monsters > 1  && monsters % 4 == 0) {
					var mx:Image = new Image(DStarling.assetsManager.getTexture("coin"));
					addChild(mx);
					mx.x = Math.random() * stage.stageWidth;
					mx.y = Math.random() * stage.stageHeight
					mx.name = 'coin';
					monsters = 0;
				}else {
					var mc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk00"));
					addChild(mc);
					mc.x = Math.random() * stage.stageWidth;
					mc.y = Math.random() * stage.stageHeight;
					Starling.juggler.add(mc);
					mc.name = 'green';
					monsters++;
				}
			}
			
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			if (timer.currentCount % 4 == 0) {
				
			}else {
				var mc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk00"));
				addChild(mc);
				mc.x = Math.random() * stage.stageWidth;
				mc.y = Math.random() * stage.stageHeight;
				Starling.juggler.add(mc);
				mc.name = 'green';
			}
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(this);
			if (touch != null) {
				if (touch.phase == TouchPhase.BEGAN) {
					var content:DisplayObject = e.target as DisplayObject;
					if (content.name == 'coin' || content.name == 'green') {
						removeChild(content);
					}
				}
			}
		}
	}

}