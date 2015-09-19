package 
{
	import starling.display.Button;
	import starling.events.Event;
	import Utils.start.DStarling;
	import Utils.states.DState;
	import Utils.states.DStateManager;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Menu extends DState
	{
		
		public function Menu() 
		{
			super("bgWelcome");
		}
		
		override public function init():void {
			super.init();
			var button:Button = new Button(
					DStarling.assetsManager.getTexture("welcome_playButton"));
			addChild(button);
			button.alignPivot();
			button.x = stage.stageWidth / 2;
			button.y = stage.stageHeight / 2;
			stage.addEventListener(Event.TRIGGERED, onTrigger);
		}
		
		private function onTrigger(e:Event):void 
		{
			DStateManager.start("Game");
		}
		
		override public function destroy():void {
			stage.removeEventListener(Event.TRIGGERED, onTrigger);
			super.destroy();
		}
			
	}

}