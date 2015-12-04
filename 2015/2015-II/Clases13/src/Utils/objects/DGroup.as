package Utils.objects 
{
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DGroup extends Sprite
	{
		
		public function DGroup() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			removeChildren();
		}
		
		public function createMultiple(elements:int, obj:Class):void {
			for (var i:int = 0; i < elements; i++) 
			{
				var mc:DGameObject = new obj();
				mc.alife = false;
				mc.visible = false;
				addChild(mc);
			}
		}
		
		public function getFirstAlive():DGameObject{
			for (var i:int = 0; i < numChildren; i++) 
			{
				var mc:DGameObject = getChildAt(i) as DGameObject;
				if (mc.alife)
					return mc;
			}
			return null;
		}
		
		public function getFirstDead():DGameObject{
			for (var i:int = 0; i < numChildren; i++) 
			{
				var mc:DGameObject = getChildAt(i) as DGameObject;
				if (!mc.alife)
					return mc;
			}
			return null;
		}
		
	}

}