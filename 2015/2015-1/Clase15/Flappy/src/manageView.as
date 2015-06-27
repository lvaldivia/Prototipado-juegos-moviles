package 
{
	import xxx.manager.screenManager;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class manageView extends screenManager 
	{
		
		public function manageView() 
		{
			super();
			
		}
		
		override public function start():void {
			var game:Game = new Game();
			addChild(game);
		}
		
	}

}