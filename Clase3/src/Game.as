package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.inputs.XXXKeyboard;
	import XXXNoScope360HeadShot.inputs.XXXMouse;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite 
	{
		private var hero:Hero;
		private var enemy:Enemy;
		private var combos:int;
		public function Game() 
		{
			super();
			combos = 1;
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(0xFFFFFF, 0);
			bg.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			bg.graphics.endFill();
			addChild(bg);
			hero = new Hero();
			addChild(hero);
			XXXKeyboard.init(stage);
			XXXMouse.init(stage);
			stage.addEventListener(Event.ENTER_FRAME, loop);
			enemy = new Enemy();
			addChild(enemy) ;
		}
		
		private function loop(e:Event):void 
		{
			if (XXXMouse.clickObj != null) {
				if (XXXMouse.clickObj.parent is Hero) {
					combos++;
				}else {
					combos = 0;
				}
			}
			XXXMouse.clear();
			hero.update();
			enemy.update();
		}
		
	}

}