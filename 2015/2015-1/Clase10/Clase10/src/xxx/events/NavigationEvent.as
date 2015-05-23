package xxx.events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_VIEW:String = 'changeView';
		public static var goTo:Class;
		public function NavigationEvent(type:String, _goTo:Class, bubbles:Boolean = true, data:Object = null) 
		{
			super(type, bubbles, data);
			goTo = _goTo;
		}
		
	}

}