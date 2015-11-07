package objects 
{
	import Utils.objects.DGameObject;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Background extends DGameObject
	{
		
		public function Background() 
		{
			super("background.png");
		}
		
		override public function init():void{
			super.init();
		}
		
	}

}