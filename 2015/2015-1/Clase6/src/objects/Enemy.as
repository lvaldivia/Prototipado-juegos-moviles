package objects 
{
	import xxx.Math.Utils;
	import xxx.Math.Vector2D;
	import xxx.objects.Entity;

	/**
	 * ...
	 * @author Luis
	 */
	public class Enemy extends Entity 
	{
		
		public function Enemy() 
		{
			super();
			centerPivot = true;
			textures = Global.assets.getTextureAtlas('palitos').getTextures('mc_Enemy0000');
		}
		
		override public function init():void {
			
			position = new Vector2D(Utils.randomRange(width, stage.stageWidth ), 150);
			super.init();
		}
		
		override public function update():void {
			position.y += 2;
			super.update();
			if (position.y >= stage.stageHeight) {
				trace('salio');
				outOfBounds = true;
			}
		}
		
	}

}