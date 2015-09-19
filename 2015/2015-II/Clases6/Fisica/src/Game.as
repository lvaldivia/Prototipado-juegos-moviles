package
{
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import nape.util.Debug;
	import starling.core.Starling;
	import starling.events.Event;
	import Utils.states.DState;
	import Utils.time.DTempo;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends DState
	{
		private var space:Space;
		private var debug_world:BitmapDebug;
		private var elapsed:Number;
		
		public function Game()
		{
			super("back");
		}
		
		override public function init():void
		{
			super.init();
			var gravity:Vec2 = new Vec2(0, 500);
			space = new Space(gravity);
			trace(space.gravity);
			var floor:Body = new Body(BodyType.STATIC);
			floor.shapes.add(new Polygon(Polygon.rect(0, stage.stageHeight - 50, stage.stageWidth, 50)));
			floor.space = space;
			stage.addEventListener(Event.ENTER_FRAME, loop);
			debug_world = new BitmapDebug(Starling.current.stage.stageWidth, Starling.current.stage.stageHeight);
			Starling.current.nativeOverlay.addChild(debug_world.display);
			elapsed = 0;
			DTempo.init();
		}
		
		private function loop(e:Event):void
		{
			DTempo.update();
			elapsed += DTempo.dt;
			//trace(elapsed);
			if (elapsed >= 1)
			{
				elapsed = 0;
				//trace("crear");
				addBall();
			}
			space.step(1 / 60);
			debug_world.clear();
			debug_world.draw(space);
			debug_world.flush();
		}
		
		private function addBall():void
		{
			var ball:Body = new Body(BodyType.DYNAMIC, new Vec2(Math.random() * stage.stageWidth, stage.stageHeight - 80));
			ball.shapes.add(new Circle(20, null, new Material(20)));
			space.bodies.add(ball);
			ball.space = space;
			ball.velocity.y = -200;

		}
	
	}

}