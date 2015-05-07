package views 
{
	import objects.Bullet;
	import objects.Enemy;
	import objects.Hero;
	import starling.events.Event;
	import xxx.input.XXXKeyboard;
	import xxx.input.XXXMouse;
	import xxx.time.XXXTime;
	import xxx.views.XXXView;

	
	/**
	 * ...
	 * @author Luis
	 */
	public class Game extends XXXView 
	{
		private var hero:Hero;
		private var elapsed:Number=0;
		private var duration:Number = 1;
		private var enemys:Vector.<Enemy>;
		private var bullets:Vector.<Bullet>;
		private var elapsedBullet:Number;
		public function Game() 
		{
			super();
			texture = Global.assets.getTexture('background');
		}
		
		override public function init():void {
			super.init();
			elapsedBullet = 0;
			enemys = new Vector.<Enemy>();
			bullets = new Vector.<Bullet>();
			hero = new Hero();
			addChild (hero);
			XXXTime.init();
			XXXKeyboard.init(stage);
			XXXMouse.init(stage);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		
		private function loop(e:Event):void 
		{
			XXXTime.update();
			elapsed += XXXTime.dt;
			if (elapsed >= duration) {
				elapsed = 0;
				var enemy:Enemy = new Enemy();
				addChild(enemy);
				enemys.push(enemy);
			}
			hero.update();
			elapsedBullet += XXXTime.dt;
			if (XXXMouse.isDown) {
				XXXMouse.isDown = false;
				if (elapsedBullet >= 0.2) {
						elapsedBullet = 0;
						var angle:Number = Math.atan2(XXXMouse.y - hero.y, XXXMouse.x -hero.x);
						var b:Bullet = new Bullet(hero.x, hero.y, angle);
						bullets.push(b);
						addChild(b);
				}
			
			}
			var total:int = enemys.length;
			var bs:int = bullets.length;
			for (var i:int = 0; i < total; i++) 
			{
				enemys[i].update();
				if (enemys[i].hit(hero)) {
					//trace(i);
				}
				if (enemys[i].outOfBounds) {
					removeChild(enemys[i]);
					enemys.splice(i, 1);
					total--;
				}else {
					for (var k:int = 0; k < bs; k++) 
					{
						if(enemys.length>i){
							if (enemys[i].hit(bullets[k])) {
								removeChild(bullets[k]);
								bullets.splice(k, 1);
								bs--;
								removeChild(enemys[i]);
								enemys.splice(i, 1);
								total--;
							}
						}
					}
				}
			}
			
			for (var j:int = 0; j < bs; j++) 
			{
				bullets[j].update();
				if (bullets[j].outOfBounds) {
					removeChild(bullets[j]);
					bullets.splice(j, 1);
					bs--;
				}
			}

		}
		
	}

}