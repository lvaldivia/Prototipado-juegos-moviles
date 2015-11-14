package 
{
	import mx.core.ButtonAsset;
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
		private var button:Button;
		
		public function Menu() 
		{
			super("bgWelcome");
		}
		
		override public function init():void{
			super.init();
			button = new Button(DStarling.assetsManager.getTexture("startButton"));
			addChild(button);
			button.alignPivot();
			
			button.name = "start";
			button.x = stage.stageWidth / 2;
			button.y = stage.stageHeight / 2;
			stage.addEventListener(Event.TRIGGERED, onTriggerd);
		}
		
		private function onTriggerd(e:Event):void 
		{
			var mc:Button = e.target as Button;
			if(mc.name == "start"){
				DStateManager.start("Game");
			}
		}
		
		override public function destroy():void {
			stage.removeEventListener(Event.TRIGGERED, onTriggerd);
			super.destroy();
		}
		
	}

}