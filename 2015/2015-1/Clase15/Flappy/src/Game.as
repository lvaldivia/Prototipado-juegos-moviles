package
{
	import nape.callbacks.CbEvent;
	import nape.callbacks.CbType;
	import nape.callbacks.InteractionCallback;
	import nape.callbacks.InteractionListener;
	import nape.callbacks.InteractionType;
	import nape.geom.Vec2;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXMouse;
	import xxx.physics.PhysicsWorld;
	import xxx.time.XXXTime;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends PhysicsWorld
	{
		private var bird:Bird;
		private var elapsed:Number = 0;
		private var elapsedPipes:Number = 0;
		private var pipes:Sprite;
		private var pipeGroup:CbType;
		private var heroGroup:CbType;
		
		public function Game()
		{
			debug = true;
			gravity = new Vec2(0, 800);
			super();
		}
		
		override public function init():void
		{
			super.init();
			pipeGroup = new CbType();
			heroGroup = new CbType();
			bird = new Bird(space, new Vec2(50, 50));
			addChild(bird);
			bird.addCollisionType(heroGroup);
			XXXTime.init();
			pipes = new Sprite();
			addChild(pipes);
			XXXMouse.init(stage);
			var interactionListener:InteractionListener = 
					new InteractionListener(CbEvent.BEGIN, 
							InteractionType.ANY, heroGroup, pipeGroup, handleCollision);
			space.listeners.add(interactionListener);
		}
		
		private function handleCollision(collision:InteractionCallback):void 
		{
			trace(collision.int1);
			trace(collision.int2);
		}
		
		override public function loop(e:Event):void
		{
			super.loop(e);
			bird.update();
			XXXTime.update();
			elapsed += XXXTime.dt;
			if (elapsed >= 0.2)
			{
				elapsed = 0;
				if (XXXMouse.isDown)
				{
					XXXMouse.isDown = false;
					bird.body.velocity.y = -300;
				}
			}
			elapsedPipes += XXXTime.dt;
			if (elapsedPipes >= 2)
			{
				elapsedPipes = 0;
				addPipe();
			}
			for (var i:int = 0; i < pipes.numChildren; i++) 
			{
				var p:Pipe = pipes.getChildAt(i) as Pipe;
				if (p.body.position.x + 40 < bird.body.position.x && !p.giveScore) {
					p.giveScore = true;
					trace("score");
				}
				p.update();
			}
		}
		
		private function addPipe():void
		{
			var pipeHolePosition:Number = randomizePipeY(50, 430 - 120);
			var pipe1:Pipe = new Pipe(space, new Vec2(380, pipeHolePosition - 480));
			
			pipes.addChild(pipe1);
			pipe1.addCollisionType(pipeGroup);
			var pipe2:Pipe = new Pipe(space, new Vec2(380, pipeHolePosition + 120));
			pipes.addChild(pipe2);
			pipe2.addCollisionType(pipeGroup);
		}
		
		private function randomizePipeY(min:Number, max:Number):Number
		{
			return randRange(min, max);
		}
		
		private function randRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
	
	}

}