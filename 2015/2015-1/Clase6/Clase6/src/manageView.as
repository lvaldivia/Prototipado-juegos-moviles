package 
{
	import events.NavigationEvent;
	import starling.display.Sprite;
	import starling.events.Event;
	import views.Menu;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class manageView extends Sprite 
	{
		private var current:Sprite;
		
		public function manageView() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		public function start():void 
		{
			current = new Menu();
			addChild(current);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
		}
		
		private function onChangeView(e:NavigationEvent):void 
		{
			removeChild(current);
			var c:Class = e.view;
			current =new c();
			addChild(current);
		}
		
	}

}