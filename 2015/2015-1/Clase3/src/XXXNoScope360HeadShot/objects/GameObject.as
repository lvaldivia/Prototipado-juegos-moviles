package XXXNoScope360HeadShot.objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class GameObject extends Sprite 
	{
		protected var skin:Sprite;
		protected var velocity:int;
		protected var assetClass:Class;
		public function GameObject() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			create();
			init();
		}
		
		public function init():void 
		{
			velocity = 1;
		}
		
		public function create():void 
		{
			skin = new assetClass();
			addChild(skin);
		}
		
		public function update():void {
			x += 1;
		}
		
		public function destroy():void {
			if(skin!=null){
				removeChild(skin);
			}
		}
		
	}

}