package Views 
{
	import GameObjects.Ball;
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
	import starling.events.Event;
	import xxx.start.XXXStarling;
	import xxx.views.XXXView;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends XXXView 
	{
		private var debug:BitmapDebug;
		private var space:Space;
		private var floor:Body;
		private var debug_world:Boolean = false;
		private var wallGroup:CbType;
		private var ballGroup:CbType;
		private var interaction:InteractionListener;
		
		public function Game() 
		{
			super();
		}
		
		override public function init():void {
			texture = XXXStarling.assetManager.getTexture("back");
			super.init();
			wallGroup = new CbType();
			ballGroup = new CbType();
			interaction = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION,
							wallGroup, ballGroup, checkCollision);
			space = new Space(new Vec2(0, 5000));
			floor = new Body(BodyType.STATIC);
			floor.shapes.add(new Polygon(Polygon.rect(0, stage.stageHeight, 
						stage.stageWidth, 50)));
			floor.cbTypes.add(wallGroup);
			floor.space = space;
			debug = new BitmapDebug(Starling.current.stage.stageWidth, Starling.current.stage.stageHeight);
			if (debug_world) {
				Starling.current.nativeOverlay.addChild(debug.display);
			}
			space.listeners.add(interaction);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function checkCollision(collision:InteractionCallback):void 
		{
			trace(collision.int1, collision.int2.user);
		}
		
		private function loop(e:Event):void 
		{
			if (Math.random() < 0.03) {
				generateBall();
			}
			if(debug_world){
				debug.clear();
				debug.draw(space);
				debug.flush();
			}
			space.step(1 / 60);
			space.liveBodies.foreach(updatePosition);
		}
		
		private function updatePosition(b:Body):void 
		{
			b.userData.graphics.x  = b.position.x;
			b.userData.graphics.y  = b.position.y;
			b.userData.graphics.rotation = b.rotation;
		}
		
		private function generateBall():void 
		{
			var ball:Body = new Body(BodyType.DYNAMIC, new Vec2(Math.random() * stage.stageWidth, 0));
			ball.shapes.add(new Circle(50, null, new Material(20)));
			ball.space = space;
			ball.cbTypes.add(ballGroup);
			ball.userData.graphics = new Ball();
			addChild(ball.userData.graphics);
		}
		
	}

}