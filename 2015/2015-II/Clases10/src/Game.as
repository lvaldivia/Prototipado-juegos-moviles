package
{
	import nape.callbacks.CbEvent;
	import nape.callbacks.CbType;
	import nape.callbacks.InteractionCallback;
	import nape.callbacks.InteractionListener;
	import nape.callbacks.InteractionType;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import objects.Background;
	import starling.display.Sprite;
	import starling.text.TextField;
	import treefortress.sound.SoundAS;
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
		private var aux:Number = 0;
		private var textField:TextField;
		private var score:Number;
		private var birdCollisionGroup:CbType;
		private var pipeCollisionGroup:CbType;
		
		public function Game()
		{
			super("", new Vec2(0, 500), true);
		}
		
		override public function init():void
		{
			super.init();
			SoundAS.loadSound("assets/flap.mp3", "flap");
			SoundAS.loadSound("assets/pipe-hit.mp3", "pipehit");
			SoundAS.loadSound("assets/ground-hit.mp3", "ground");
			SoundAS.loadSound("assets/ouch.mp3", "ouch");
			SoundAS.loadSound("assets/score.mp3", "score");
			
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
			score = 0;
			textField = new TextField(100, 100, "Scores :", "Verdana", 18, 0xFFFFFF, true);
			addChild(textField);
			birdCollisionGroup = new CbType();
			pipeCollisionGroup = new CbType();
			
			var top:Limit = new Limit(space, new Vec2(0,0));
			addChild(top);
			var floor:Limit = new Limit(space, 
					new Vec2(0, stage.stageHeight - 30));
			addChild(floor);
			bird.addCollisionType(birdCollisionGroup);
			var interactionListener:InteractionListener = 
						new InteractionListener(CbEvent.BEGIN,
								InteractionType.ANY,
								birdCollisionGroup, pipeCollisionGroup, handleCollision);
			space.listeners.add(interactionListener);
		}
		
		private function handleCollision(collision:InteractionCallback):void 
		{
			if(collision.int1.userData.panchito_potato is Bird){
				
			}
			if (collision.int2.userData.panchito_potato is Pipe) {
				SoundAS.play("ouch");
				var b:Bird = collision.int1.userData.panchito_potato as Bird;
				b.alife = false;
			}
		}
		
		override public function update():void
		{
			if(!bird.alife) return;
			super.update();
			elapsed += deltaTime;
			elapsedPipes += deltaTime;
			if (elapsed >= 0.2)
			{
				bird.fap();
			}
			bird.update();
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
					if(p.body.position.x + 50 < bird.body.position.x && !p.giveScore){
						p.giveScore = true;
						score+= 0.5;
						SoundAS.play("score");
						textField.text = "Scores :"+score.toString();
					}
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
			var pipeHolePosition:Number = randomizePipeY( -50, 60 );
			aux = pipeHolePosition;
			var pipe1:Pipe = new Pipe(true,space, new Vec2(stage.stageWidth, -150));
			pipes.addChild(pipe1);
			pipe1.addCollisionType(pipeCollisionGroup);
			var pipe2:Pipe = new Pipe(false,space, new Vec2(stage.stageWidth, 300));
			pipes.addChild(pipe2);
			pipe2.addCollisionType(pipeCollisionGroup);
			setChildIndex(textField, numChildren - 1);
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