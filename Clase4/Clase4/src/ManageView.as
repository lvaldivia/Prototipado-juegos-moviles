package 
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class ManageView extends Sprite 
	{
		private var palito:MovieClip;
		
		public function ManageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		public function start():void {
			var bg:Image = new Image(Global.assetsManager.getTexture("background"));
			addChild(bg);
			palito = new MovieClip(Global.assetsManager.getTextureAtlas("palitos").getTextures("mc_Player00"));
			addChild(palito);
			palito.x = 100;
			palito.y = 100;
			Starling.juggler.add(palito);
			var enemy:Image = new Image(Global.assetsManager.getTextureAtlas("palitos").getTexture("mc_Enemy0000"));
			addChild(enemy);
			enemy.y = 150;
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			palito.x += 1;
		}
		
	}

}