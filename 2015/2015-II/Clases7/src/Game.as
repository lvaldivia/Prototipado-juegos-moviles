package 
{
	import objects.Background;
	import starling.display.Sprite;
	import Utils.states.DState;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends DState 
	{
		private var bgs:Sprite;
		public function Game() 
		{
			super("",true);
		}
		
		override public function init():void{
			super.init();
			bgs = new Sprite();
			addChild(bgs);
			for (var i:int = 0; i < 2; i++) 
			{
				var background:Background = new Background();
				bgs.addChild(background);
				background.x = background.width * i;
			}
		}
		
		override public function update():void{
			super.update();
			for (var i:int = 0; i < bgs.numChildren; i++) 
			{
				var g:Background = bgs.getChildAt(i) as Background;
				g.x -= 2;
				if (g.x < -g.width) {
					g.x = stage.stageWidth;
				}
			}
		}
		
	}

}