package gameObjects 
{
	import starling.display.Image;
	import xxx.Math.Vector2D;
	import xxx.objects.Entity;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Enemy extends Entity 
	{
		
		public function Enemy() 
		{
			super();
			skin =new Image(Global.assetManager.getTextureAtlas("palitos").getTexture("mc_Enemy0000"));
		}
		
		override public function init():void {
			super.init();
			skin.alignPivot();
			position = new Vector2D(Math.random() * (stage.stageWidth - (width / 2)), -height);
			velocity = new Vector2D(0, 0);
		}
		
		override public function update():void {
			position.y += 1;
			super.update();
		}
		
	}

}