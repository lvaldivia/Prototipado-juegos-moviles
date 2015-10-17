package
{
	import nape.geom.Vec2;
	import objects.Background;
	import starling.display.Sprite;
	import Utils.input.DMouse;
	import Utils.objects.DGroup;
	import Utils.physics.DPhysicWorld;
	import Utils.states.DState;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends DPhysicWorld
	{
		private var bgs:Sprite;
		private var bird:Bird;
		private var elapsed:Number;
		private var pipes:DGroup;
		private var elapsedPipes:Number;
		
		public function Game()
		{
			super("", new Vec2(0, 500), true);
		}
		
		override public function init():void
		{
			super.init();
			bgs = new Sprite();
			addChild(bgs);
			for (var i:int = 0; i < 2; i++)
			{
				var background:Background = new Background();
				bgs.addChild(background);
				background.x = background.width * i;
			}
			bird = new Bird(space, new Vec2(50, 50));
			addChild(bird);
			DMouse.init(stage);
			elapsed = 0;
			elapsedPipes = 0;
		}
		
		override public function update():void
		{
			super.update();
			elapsed += deltaTime;
			elapsedPipes += deltaTime;
			if (elapsed >= 0.2)
			{
				bird.fap();
			}
			for (var i:int = 0; i < bgs.numChildren; i++)
			{
				var g:Background = bgs.getChildAt(i) as Background;
				g.x -= 2;
				if (g.x < -g.width)
				{
					g.x = stage.stageWidth;
				}
			}
			if (elapsedPipes >= 2)
			{
				elapsedPipes = 0;
				generatePipe();
			}
			if (pipes != null)
			{
				for (var j:int = 0; j < pipes.numChildren; j++)
				{
					var p:Pipe = pipes.getChildAt(j) as Pipe;
					p.update();
				}
			}
		}
		
		private function generatePipe():void
		{
			if (pipes == null)
			{
				pipes = new DGroup();
				addChild(pipes);
			}
			var pipeHolePosition:Number = randomizePipeY(-50, 500 );
			var pipe1:Pipe = new Pipe(space, new Vec2(100, -50));
			pipes.addChild(pipe1);
			var pipe2:Pipe = new Pipe(space, new Vec2(100, 550));
			pipes.addChild(pipe2);
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