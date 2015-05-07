package events 
{
	import  starling.events.Event;
	
	/**
	 * ...
	 * @author Luis
	 */
	public class NavigationEvent extends Event 
	{
		public static var CHANGE_VIEW:String = 'changeView';
		public var view:Class;
		public function NavigationEvent(type:String, _view:Class,bubbles:Boolean=true, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			view = _view;
		} 
		
	}
	
}