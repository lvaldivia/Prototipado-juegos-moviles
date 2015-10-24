package 
{
	import starling.display.Sprite;
	import Utils.states.DStateManager;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class manageView extends Sprite 
	{
		
		public function manageView() 
		{
			super();
		}
		
		public function start():void{
			DStateManager.init(this);
			DStateManager.register("Menu", Menu);
			DStateManager.register("Game", Game);
			DStateManager.start("Menu");
		}
		
	}

}