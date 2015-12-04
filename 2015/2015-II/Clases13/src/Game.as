package 
{
	import nape.geom.Vec2;
	import starling.display.Sprite;
	import Utils.input.DKeyboard;
	import Utils.physics.DPhysicWorld;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends DPhysicWorld 
	{
		private var player:Player;
		
		public function Game() 
		{
			super("",new Vec2(0,300),true);
		}
		
		override public function init():void{
			super.init();
			addPlatforms();
			createPlayer();
			DKeyboard.init(stage);
			
		}
		
		private function createPlayer():void 
		{
			player = new Player(space, new Vec2(0, 150));
			addChild(player);
		}
		
		override public function update():void{
			
			super.update();
			player.update();
		}
		
		private function addPlatforms():void{
			var total:int = Math.ceil(stage.stageWidth / 70);
			for (var i:int = 0; i < total; i++) 
			{
				var platform:Platform = new Platform(space, new Vec2(i*70, 350));
				addChild(platform);
			}
		}
		
	}

}