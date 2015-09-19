package 
{
	import Utils.states.DState;
	/**
	 * ...
	 * @author ISIL
	 */
	public class MainGame extends DState
	{
		
		public function MainGame() 
		{
			super("bgLayer1");
		}
		
		override public function init():void {
			super.init();
			var hero:Hero = new Hero();
			addChild(hero);
		}
		
	}

}