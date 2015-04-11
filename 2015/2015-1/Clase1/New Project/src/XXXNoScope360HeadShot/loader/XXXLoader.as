package XXXNoScope360HeadShot.loader 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	/**
	 * ...
	 * @author ISIL
	 */
	public class XXXLoader 
	{
		private var loader:Loader;
		private var _onComplete:Function;
		
		public function XXXLoader(url:String,on_complete:Function) 
		{			
			loader = new Loader();
			_onComplete = on_complete;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			var urlRequest:URLRequest = new URLRequest(url);
			loader.load(urlRequest);
		}
		
		private function onComplete(e:Event):void 
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			Global.assets = e.target.applicationDomain;
			trace("end_loading");
			_onComplete();
		}
		
	}

}