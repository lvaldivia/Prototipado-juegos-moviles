package xxx.Time 
{
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author ISIL
	 */
	public class XXXTime 
	{
		static public var dt:Number;
		static public var currentTime:Number;
		static public function init():void {
			dt = 0;
			currentTime = getTimer();
		}
		
		static public function update():void {
			dt = (getTimer() - currentTime) * 0.001;
			currentTime = getTimer();
		}
		
	}

}