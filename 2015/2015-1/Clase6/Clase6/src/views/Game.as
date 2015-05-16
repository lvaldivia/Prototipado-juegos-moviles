package views 
{
	import gameObjects.Enemy;
	import gameObjects.Hero;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXKeyboard;
	import xxx.input.XXXMouse;
	import xxx.Time.XXXTime;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite 
	{
		private var hero:Hero;
		private var elapsed:Number;
		private var enemys:Vector.<Enemy>;
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function added(e:Event):void 
		{
			elapsed = 0;
			enemys = new Vector.<Enemy>();
			removeEventListener(Event.ADDED_TO_STAGE, added);
			XXXMouse.init(stage);
			XXXTime.init();
			XXXKeyboard.init(stage);
			var bg:Image = new Image(Global.assetManager.getTexture("background"));
			addChild(bg);
			hero = new Hero();
			addChild(hero);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			XXXTime.update();
			elapsed += XXXTime.dt;
			if (elapsed >= 1) {
				var enemy:Enemy = new Enemy();
				addChild(enemy);
				elapsed = 0;
				enemys.push(enemy);
			}
			var total:int = enemys.length;
			for (var i:int = 0; i < total; i++) 
			{
				enemys[i].update();
				if (enemys[i].hit(hero)) {
					removeChild(enemys[i]);
					enemys.splice(i, 1);
					total--;
				}
				
			}
			hero.update();
			
		}
		
	}

}