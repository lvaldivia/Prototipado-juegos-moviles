package gameObjects 
{
	import starling.display.MovieClip;
	import xxx.input.XXXMouse;
	import xxx.Math.Vector2D;
	import xxx.objects.Entity;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Hero extends Entity 
	{
		
		public function Hero() 
		{
			animations = new MovieClip(Global.assetManager.getTextureAtlas('palitos').getTextures("mc_Player00"));
		}
		
		override public function init():void {
			animations.alignPivot();
			position = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
			super.init();
		}
		
		override public function update():void {
			if (XXXMouse.isDown) {
				XXXMouse.isDown = false;
				var angle:Number = Math.atan2(XXXMouse.y - y, XXXMouse.x - x);
			}
			super.update();
		}
		
	}

}