package 
{
	import objects.Background;
	import starling.display.Button;
	import starling.display.Sprite;
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
		private var bgs:Sprite;
		private var button:Button;
		public function Menu() 
		{
			super();
		}
		
		override public function init():void{
			super.init();
			bgs = new Sprite();
			addChild(bgs);
			for (var i:int = 0; i < 3; i++) 
			{
				var background:Background = new Background();
				bgs.addChild(background);
				background.x = background.width * i;
			}
			button = new Button(
				DStarling.assetsManager.getTexture("get-ready.png"));
			addChild(button);
			button.alignPivot();
			button.x = stage.stageWidth / 2;
			button.y = stage.stageHeight / 2;
			stage.addEventListener(Event.TRIGGERED, onTriger);
		}
		
		private function onTriger(e:Event):void 
		{
			DStateManager.start("Game");
		}
		
		override public function destroy():void {
			stage.removeEventListener(
					Event.TRIGGERED, onTriger);
			super.destroy();
		}
		
	}

}