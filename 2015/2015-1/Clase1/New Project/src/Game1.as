package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game1 extends Sprite
	{
		private var circle:Sprite;
		private var timer:Timer;
		
		public function Game1()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			circle = new Sprite();
			circle.graphics.beginFill(0x800040);
			circle.graphics.drawCircle(0, 0, 100);
			circle.graphics.endFill();
			circle.x = 100;
			circle.y = 100;
			addChild(circle);
			circle.buttonMode = true;
			circle.addEventListener(MouseEvent.CLICK, clickCircle);
			//setTimeout(drawRectangle, 1000);
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, drawRectangle);
		}
		
		private function drawRectangle(e:TimerEvent):void
		{
			var rectangle:Sprite = new Sprite();
			rectangle.graphics.beginFill(Math.random() * 0x0F312D);
			rectangle.graphics.drawRect(0, 0, 250, 150);
			rectangle.graphics.endFill();
			rectangle.x = Math.random() * stage.stageWidth;
			rectangle.y = Math.random() * stage.stageHeight;
			addChild(rectangle);
			rectangle.addEventListener(MouseEvent.CLICK, clickRectangle);
		}
		
		private function clickRectangle(e:MouseEvent):void
		{
			trace("desaparece");
			var mc:Sprite = e.currentTarget as Sprite;			
			removeChild(mc);
		}
		
		private function clickCircle(e:MouseEvent):void
		{
			if (!timer.running) {
				timer.start();
			}else {
				timer.stop();
			}
		}
	
	}

}