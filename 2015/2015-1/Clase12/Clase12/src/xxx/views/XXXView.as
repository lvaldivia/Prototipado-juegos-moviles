package xxx.views 
{
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Yorsh
	 */
	public class XXXView extends Sprite 
	{
		protected var texture:Texture;
		public function XXXView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			init();
		}
		
		public function init():void 
		{
			if (texture != null) {
				var image:Image = new Image(texture);
				addChild(image);
			}else {
				var quad:Quad = new Quad(stage.stageWidth, stage.stageHeight);
				addChild(quad);
			}
		}
		public function startAnims():void {
			
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
		}
		
		public function destroy():void 
		{
			while (numChildren > 0) {
				removeChildAt(0);
			}
		}
		
	}

}