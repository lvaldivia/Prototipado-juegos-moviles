package
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) added();
			else addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var assets:Vector.<String> = new Vector.<String>();
			assets.push("assets/back.png");
			assets.push("assets/basketball.png");
			assets.push("assets/assets.png");
			assets.push("assets/assets.xml");
			DStarling.init(manageView, stage, assets);
		}
		
		private function deactivate(e:Event):void 
		{
		}
		
	}
	
}