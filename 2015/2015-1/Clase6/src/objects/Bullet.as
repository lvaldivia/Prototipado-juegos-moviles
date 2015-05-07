package objects 
{
	import xxx.Math.Vector2D;
	import xxx.objects.Entity;

	
	/**
	 * ...
	 * @author Luis
	 */
	public class Bullet extends Entity 
	{
		private var posX:Number;
		private var posY:Number;
		private var angle:Number;
		public function Bullet(pX:Number, pY:Number,angleHero:Number) 
		{
			super();
			posX = pX;
			posY = pY;
			angle = angleHero;
			textures = Global.assets.getTextureAtlas('palitos').getTextures('mc_Bullet0000');
			centerPivot = true;
		}
		
		override public function init():void {
			
			position = new Vector2D(posX, posY);
			super.init();
		}
		
		override public function update():void {
			position.x += Math.cos(angle) * 5;
			position.y += Math.sin(angle) * 5;
			if (position.x < 0) {
				outOfBounds = true;
			}
			if (position.y < 0) {
				outOfBounds = true;
			}
			if (position.x>stage.stageWidth) {
				_outOfBounds = true;
			}
			if (position.y > stage.stageHeight) {
				outOfBounds = true;
			}
			super.update();
		}
		
	}

}