package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.inputs.XXXKeyboard;
	import XXXNoScope360HeadShot.loader.XXXLoader;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Hero extends Sprite 
	{
		private var skin:Sprite;
		private var velocity:int;
		public function Hero() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			velocity = 1;
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = XXXLoader.getAsset("hero");
			skin = new c();
			addChild(skin);
		}
		
		public function update():void {
			if (XXXKeyboard.left_down) {
				skin.x -= velocity;
			}
			if (XXXKeyboard.right_down) {
				skin.x += velocity;
			}
			
		}
		
	}

}