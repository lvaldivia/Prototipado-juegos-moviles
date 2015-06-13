package 
{
	import citrus.core.State;
	import citrus.math.MathVector;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends State 
	{
		
		public function Game() 
		{
			super();
		}
		
		override public function initialize():void {
			super.initialize();
			trace("hola citrus");
			var box2d:Box2D = new Box2D('box2d');
			//box2d.gravity.y = 0;
			box2d.visible = true;
			add(box2d);
			initPlatforms();
		}
		
		private function initPlatforms():void 
		{
			var wallLeft:Platform = new Platform('wallLeft', { x:25, y:stage.stageHeight / 2, width:50, 
																height:stage.stageHeight } );
			add(wallLeft);
			var wallRight:Platform = new Platform("wallRight", { x:stage.stageWidth-25, y:stage.stageHeight / 2,
																width:50, height:stage.stageHeight } );
			add(wallRight);
			
																
			var floor:Platform = new Platform("floor", { x:stage.stageWidth / 2, y:stage.stageHeight-25, 
										width:stage.stageWidth, height:50});
			add(floor);
			
			var plat1:Platform = new Platform("p1", { x:60, y:450, width:150, height:50 } );
			plat1.oneWay = true;
			add(plat1);
			
			var hero:GameHero = new GameHero('hero', { x:50, y:50, width:50, height:50 } );
			add(hero);
			
			var coin:CoinGame = new CoinGame("coin", { x:60, y:400, width:200 } );
			add(coin);
			
			var movingPlat:MovingPlatform = new MovingPlatform('mv', { x:300, y:550, width:250, height:50, endX: 300, endY:100 } );
			//movingPlat.oneWay = true;
			add(movingPlat);
			
			//var enemy:Enemy = new Enemy("enemy", { x:300, y:450, width:150, height:50,startingDirection:'right',leftBound:100,rightBound:200 } );
			//add(enemy);
		}
		
	}

}