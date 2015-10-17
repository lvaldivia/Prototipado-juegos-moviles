package Utils.physics 
{
	import nape.geom.Vec2;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import starling.core.Starling;
	import Utils.states.DState;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class DPhysicWorld extends DState 
	{
		protected var debug:Boolean;
		protected var space:Space;
		protected var gravity:Vec2;
		protected var bitmapDebug:BitmapDebug;
		protected var frameRate:int = 60;
		public function DPhysicWorld(_clip:String = "", _gravity:Vec2 = null, _debug:Boolean = false) 
		{
			super(_clip, true);
			gravity = _gravity;
			debug = _debug;
		}
		
		override public function init():void{
			super.init();
			space = new Space(gravity);
			if (debug) {
				bitmapDebug = new BitmapDebug(Starling.current.stage.stageWidth, 
					Starling.current.stage.stageHeight);
				Starling.current.nativeOverlay.addChild(bitmapDebug.display);
			}
		}
		
		override public function update():void{
			super.update();
			space.step(1 / frameRate);
			if(debug){
				bitmapDebug.clear();
				bitmapDebug.draw(space);
				bitmapDebug.flush();
			}
		}
		
		
		
	}

}