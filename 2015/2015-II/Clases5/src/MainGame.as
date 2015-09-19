package 
{
	import Utils.states.DState;
	import Utils.input.DKeyboard;
	/**
	 * ...
	 * @author ISIL
	 */
	public class MainGame extends DState
	{
		private var hero:Hero;
		
		public function MainGame() 
		{
			super();
		}
		
		override public function init():void {
			super.init();
			DKeyboard.init(stage);
			hero = new Hero();
			addChild(hero);
		}
		
		override public function update():void {
			hero.update();
		}
		
	}

}