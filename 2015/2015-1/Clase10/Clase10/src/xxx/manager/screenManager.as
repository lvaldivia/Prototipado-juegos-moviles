package xxx.manager 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.events.NavigationEvent;
	import xxx.views.XXXView;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class screenManager extends Sprite 
	{
		protected var current:XXXView;
		protected var old:XXXView;
		public function screenManager() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			addEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
			init();
		}
		
		public function onChangeView(e:NavigationEvent):void 
		{
			
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			removeEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
			destroy();
		}
		
		public function destroy():void 
		{
			
		}
		
		public function init():void 
		{
			
		}
		
	}

}