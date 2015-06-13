package Views 
{
	import GameObjects.Ball;
	import GameObjects.Floor;
	import GameObjects.Hero;
	import nape.callbacks.CbEvent;
	import nape.callbacks.CbType;
	import nape.callbacks.InteractionCallback;
	import nape.callbacks.InteractionListener;
	import nape.callbacks.InteractionType;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXKeyboard;
	import xxx.start.XXXStarling;
	import xxx.time.XXXTime;
	import xxx.views.XXXView;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends XXXView 
	{
		private var debug:BitmapDebug;
		private var space:Space;
		private var floor:Floor;
		private var debug_world:Boolean = false;
		private var wallGroup:CbType;
		private var ballGroup:CbType;
		private var interaction:InteractionListener;
		private var balls:Sprite;
		private var hero:Hero;
		
		public function Game() 
		{
			super();
		}
		
		override public function init():void {
			texture = XXXStarling.assetManager.getTexture("back");
			super.init();
			wallGroup = new CbType();
			ballGroup = new CbType();
			//interaction = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION,
							//wallGroup, ballGroup, checkCollision);
			space = new Space(new Vec2(0, 500));
			floor = new Floor(space);
			addChild(floor);
			balls = new Sprite();
			addChild(balls);
			XXXKeyboard.init(stage);
			XXXTime.init();
			hero = new Hero(space, new Vec2(stage.stageWidth / 2, stage.stageHeight-150));
			addChild(hero);
			hero.onCreateBullet = generateBall;
			debug = new BitmapDebug(Starling.current.stage.stageWidth, Starling.current.stage.stageHeight);
			if (debug_world) {
				Starling.current.nativeOverlay.addChild(debug.display);
			}
			//space.listeners.add(interaction);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function checkCollision(collision:InteractionCallback):void 
		{
			//trace(collision.int1, collision.int2);
		}
		
		private function loop(e:Event):void 
		{
			XXXTime.update();
			if (Math.random() < 0.03) {
				//generateBall();
			}
			hero.update();
			if(debug_world){
				debug.clear();
				debug.draw(space);
				debug.flush();
			}
			space.step(1 / 60);
			//space.liveBodies.foreach(updatePosition);
			for (var i:int = 0; i < balls.numChildren; i++) 
			{
				var b:Ball = balls.getChildAt(i) as Ball;
				b.update();
			}
		}
		
		private function generateBall(posX:Number,posY:Number):void 
		{
			var ball:Ball = new Ball(space, new Vec2(posX, posY));
			balls.addChild(ball);
			ball.body.group = hero.body.group;
		}
		
	}

}