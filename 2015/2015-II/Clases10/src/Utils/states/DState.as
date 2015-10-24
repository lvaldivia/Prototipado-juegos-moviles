package Utils.states
{
	import flash.desktop.NativeApplication;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import Utils.start.DStarling;
	import Utils.time.DTempo;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class DState extends Sprite
	{
		protected var skin:Image;
		protected var clip:String;
		protected var hasLoop:Boolean;
		protected var deltaTime:Number;
		
		public function DState(_clip:String = "", _loop:Boolean = true)
		{
			clip = _clip;
			hasLoop = _loop;
			deltaTime = 0;
			DTempo.init();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			NativeApplication.nativeApplication.addEventListener(flash.events.Event.ACTIVATE, activate);
			NativeApplication.nativeApplication.addEventListener(flash.events.Event.DEACTIVATE, deactivate);
			init();
			if (hasLoop)
			{
				stage.addEventListener(Event.ENTER_FRAME, loop);
			}
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function activate(e:flash.events.Event):void 
		{
			onActivate();
		}
		
		public function onActivate():void 
		{
			DStarling.start();
		}
		
		private function deactivate(e:flash.events.Event):void 
		{
			onDeactivate();
		}
		
		public function onDeactivate():void 
		{
			DStarling.pause();
		}
		
		private function loop(e:Event):void 
		{
			DTempo.update();
			update();
		}
		
		public function update():void 
		{
			deltaTime = DTempo.dt;
		}
		
		private function removed(e:Event):void
		{
			if (hasLoop) {
				stage.removeEventListener(Event.ENTER_FRAME, loop);
			}
			if(NativeApplication.nativeApplication.hasEventListener(flash.events.Event.ACTIVATE)){
				NativeApplication.nativeApplication.addEventListener(flash.events.Event.ACTIVATE, activate);
				NativeApplication.nativeApplication.addEventListener(flash.events.Event.DEACTIVATE, deactivate);
			}
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
		}
		
		public function destroy():void
		{
			removeChildren();
		}
		
		public function init():void
		{
			if (clip !== '')
			{
				skin = new Image(DStarling.assetsManager.getTexture(clip));
				addChild(skin);
			}
			else
			{
				var quad:Quad = new Quad(stage.stageWidth, stage.stageHeight, 0x00FF00);
				addChild(quad);
			}
		
		}
	
	}

}