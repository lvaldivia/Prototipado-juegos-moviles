package objects 
{
	import xxx.input.XXXKeyboard;
	import xxx.Math.Vector2D;
	import xxx.objects.Entity;

	
	/**
	 * ...
	 * @author Luis
	 */
	public class Hero extends Entity 
	{
		public var angle:Number;
		
		public function Hero() 
		{
			super();
			centerPivot = true;
			textures = Global.assets.getTextureAtlas('palitos').getTextures('mc_Player00');
		}
		
		override public function init():void {
			super.init();
			position = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
		}
		
		override public function update():void {
			velocity.x = 0;
			if (XXXKeyboard.leftPress) {
				velocity.x -= 5;
			}
			if (XXXKeyboard.rightPress) {
				velocity.x += 5;
			}
			if (x >= stage.stageWidth - (width / 2)) {
				x = stage.stageWidth - (width / 2)
			}
			if (x < width / 2) {
				x = width / 2;
			}
			
			position = Vector2D.add(position, velocity);
			super.update();
		}
		
	}

}