package Views 
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
		
		override public function init():void {
			current = new Game();
			addChild(current);
		}
		
	}

}