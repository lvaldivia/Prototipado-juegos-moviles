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
		
		override public function start():void {
			current = new World();
			addChild(current);
		}
		
	}

}