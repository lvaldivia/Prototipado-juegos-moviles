package events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_VIEW:String = 'changeView';
		public var view:Class;
		public function NavigationEvent(type:String,_view:Class ,bubbles:Boolean=true, data:Object=null) 
		{
			view = _view;
			super(type, bubbles, data);
			
		}
		
	}

}