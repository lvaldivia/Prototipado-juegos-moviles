package views 
{
	import events.NavigationEvent;
	import starling.display.Button;
	import starling.events.Event;
	import xxx.views.XXXView;

	
	/**
	 * ...
	 * @author Luis
	 */
	public class Menu extends XXXView 
	{
		
		public function Menu() 
		{
			super();
			texture = Global.assets.getTexture('background');
		}
		override public function init():void {
			super.init();
			var btn:Button = new Button(Global.assets.getTexture('start_button'));
			btn.alignPivot();
			btn.name = 'start';
			btn.x = stage.stageWidth / 2;
			btn.y = stage.stageHeight / 2;
			var stopBtn:Button = new Button(Global.assets.getTexture('stop_button'));
			stopBtn.x = stage.stageWidth / 2;
			stopBtn.y = btn.height + btn.y;
			stopBtn.alignPivot();
			addChild(stopBtn);
			addChild(btn);
			stage.addEventListener(Event.TRIGGERED, onTrigger);
		}
		
		private function onTrigger(e:Event):void 
		{
			var button:Button = e.target as Button;
			if (button.name == 'start') {
				dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, Game));
			}
		}
		
		override public function destroy():void {
			stage.removeEventListener(Event.TRIGGERED, onTrigger);
		}
		
	}

}