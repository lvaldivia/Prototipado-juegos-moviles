package Views 
{
	import flash.utils.setTimeout;
	import GameObjects.Ball;
	import GameObjects.Floor;
	import GameObjects.Hero;
	import nape.callbacks.CbEvent;
	import nape.callbacks.CbType;
	import nape.callbacks.InteractionCallback;
	import nape.callbacks.InteractionListener;
	import nape.callbacks.InteractionType;
	import nape.callbacks.PreCallback;
	import nape.callbacks.PreFlag;
	import nape.callbacks.PreListener;
	import nape.dynamics.CollisionArbiter;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXKeyboard;
	import xxx.physics.PhysicsWorld;
	import xxx.start.XXXStarling;
	import xxx.time.XXXTime;
	import xxx.views.XXXView;
	
	/**
	 * ...
	 * @author Luis
	 */
	public class World extends PhysicsWorld 
	{
		private var hero:Hero;
		private var balls:Sprite;
		private var floor:Floor;
		private var elapsed:Number;
		private var wallGroup:CbType;
		private var ballGroup:CbType;
		private var interaction:InteractionListener;
		
		public function World() 
		{
			super(true);
			gravity = new Vec2(0, 500);
		}
		
		override public function init():void {
			texture = XXXStarling.assetManager.getTexture("back");
			super.init();
			//trace(space);
			ballGroup = new CbType();
			//wallGroup = new CbType();
			hero = new Hero(space, new Vec2(stage.stageWidth / 2, stage.stageHeight-150));
			addChild(hero);
			hero.addCollisionType(ballGroup);
			interaction = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION,
							wallGroup, ballGroup, checkCollision);
			XXXKeyboard.init(stage);
			XXXTime.init();
			hero.onCreateBullet = generateBall;
			balls = new Sprite();
			addChild(balls);
			floor = new Floor(space);
			//floor.addCollisionType(wallGroup);
			addChild(floor);
			//space.listeners.add(interaction);
			var oneWayType = new CbType();
			var platform:Body = new Body(BodyType.KINEMATIC, new Vec2(150, stage.stageHeight-50));
			platform.shapes.add(new Polygon(Polygon.rect(0, 0, 250, 50)));
			space.bodies.add(platform);
			platform.cbTypes.add(oneWayType);
			
			var platform2:Body = new Body(BodyType.KINEMATIC, new Vec2(350, stage.stageHeight-150));
			platform2.shapes.add(new Polygon(Polygon.rect(0, 0, 250, 50)));
			space.bodies.add(platform2);
			platform2.cbTypes.add(oneWayType);
			
			space.listeners.add(new PreListener(
                InteractionType.COLLISION,
                oneWayType,
                CbType.ANY_BODY,
                oneWayHandler
            ));
			
		}
		
		private function checkCollision(collision:InteractionCallback):void 
		{
			trace(collision.int1, collision.int2);
		}
		
		private function generateBall(posX:Number,posY:Number):void 
		{
			var ball:Ball = new Ball(space, new Vec2(posX, posY));
			balls.addChild(ball);
			ball.body.group = hero.body.group;
		}
		
		private function oneWayHandler(cb:PreCallback):PreFlag {
            // We assigned the listener to have the one-way platform as first
            // interactor.
            //
            // PreCallback 'swapped' property as API docs describe tells us that
            // if true; arbiter.normal points from int2 to int1, else from int1 to int2
            //
            // To allow objects to move upwards through one-way platforms we must
            // ignore collisions with arbiter (pointing from one-way platform) whose normal
            // points down (y > 0). Taking swapped into account we have:
            //
            // Equally we gave the interactino type as COLLISION so that accessing
            // arbiter.collisionArbiter is always valid (non-null).
			trace(cb.int1, cb.int2.castBody);
            var colArb:CollisionArbiter = cb.arbiter.collisionArbiter;
 
            if ((colArb.normal.y > 0) != cb.swapped) {
				trace('ignore');
                return PreFlag.IGNORE;
            }
            else {
				
                return PreFlag.ACCEPT;
            }
        }
		
		override public function loop(e:Event ):void {
			XXXTime.update();
			super.loop(e);
			hero.update();
			for (var i:int = 0; i < balls.numChildren; i++) 
			{
				var b:Ball = balls.getChildAt(i) as Ball;
				b.update();
			}
		}
		
	}

}