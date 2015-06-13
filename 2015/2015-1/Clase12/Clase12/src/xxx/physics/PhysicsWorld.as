package xxx.physics 
{
	import nape.geom.Vec2;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import starling.core.Starling;
	import starling.events.Event;
	import xxx.views.XXXView;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class PhysicsWorld extends XXXView 
	{
		protected var space:Space;
		protected var debug:Boolean;
		protected var gravity:Vec2;
		protected var frameRate:int = 60;
		private var bmdDebug:BitmapDebug;
		
		public function PhysicsWorld(_debug:Boolean) 
		{
			super();
			debug = _debug;
			bmdDebug = new BitmapDebug(Starling.current.stage.stageWidth, Starling.current.stage.stageHeight);
			if (debug) {
				Starling.current.nativeOverlay.addChild(bmdDebug.display);
			}
			
		}
		
		override public function init():void {
			super.init();
			space = new Space(gravity);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop(e:Event):void 
		{
			space.step(1 / frameRate);
			if (debug) {
				bmdDebug.clear();
				bmdDebug.draw(space);
				bmdDebug.flush();
			}
		}
		
		//override public function destroy() {
			//super.destroy();
			//stage.removeEventListener(Event.ENTER_FRAME, loop);
			//for (var i:int = 0; i < space.bodies.length; i++) 
			//{
				//space.bodies.remove(space.bodies[i]);
			//}
		//}
		
	}

}