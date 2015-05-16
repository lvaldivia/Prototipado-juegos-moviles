package views 
{
	import events.NavigationEvent;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Menu extends Sprite 
	{
		
		public function Menu() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var bg:Image = new Image(Global.assetManager.getTexture("background"));
			addChild(bg);
			var startBtn:Button = new Button(Global.assetManager.getTexture("start_button"));
			startBtn.name = 'start';
			addChild(startBtn);
			startBtn.alignPivot();
			startBtn.x = stage.stageWidth / 2;
			startBtn.y = stage.stageHeight / 2;
			
			var stopBtn:Button = new Button(Global.assetManager.getTexture("stop_button"));
			addChild(stopBtn);
			stopBtn.name = 'intro';
			stopBtn.alignPivot();
			stopBtn.x = stage.stageWidth / 2;
			stopBtn.y = startBtn.y + startBtn.height;
			stage.addEventListener(Event.TRIGGERED, onTrigger);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			stage.removeEventListener(Event.TRIGGERED, onTrigger);
			while (numChildren>0) 
			{
				removeChildAt(0);
			}
		}
		
		private function onTrigger(e:Event):void 
		{
			var btn:Button = e.target as Button;
			if (btn.name == 'start') {
				dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW,Game));
			}
			if (btn.name == 'intro') {
				trace("click_intro");
			}
		}
		
	}

}