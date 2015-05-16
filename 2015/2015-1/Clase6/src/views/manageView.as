package views 
{
	import events.NavigationEvent;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.views.XXXView;

	
	/**
	 * ...
	 * @author Luis
	 */
	public class manageView extends Sprite 
	{
		private var current:XXXView;
		private var old:XXXView;
		
		public function manageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			addEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
		}
		
		private function onChangeView(e:NavigationEvent):void 
		{
			removeChild(old);
			var c:Class  = e.view; 
			current = new c();
			addChild(current);
		
		}
		
		public function start():void {
			current = new Menu();
			addChild(current);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			
		}
		
	}

}