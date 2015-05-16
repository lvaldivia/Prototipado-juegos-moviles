package gameObjects 
{
	import starling.display.MovieClip;
	import xxx.input.XXXKeyboard;
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
			velocity = new Vector2D(0, 0);
			super.init();
		}
		
		override public function update():void {
			if (XXXMouse.isDown) {
				XXXMouse.isDown = false;
				var angle:Number = Math.atan2(XXXMouse.y - y, XXXMouse.x - x);
			}
			velocity.x = 0;
			if (XXXKeyboard.leftPress) {
				velocity.x -= 2;
			}
			if (XXXKeyboard.rightPress) {
				velocity.x += 2;
			}
			position = Vector2D.add(position, velocity);
			super.update();
		}
		
	}

}