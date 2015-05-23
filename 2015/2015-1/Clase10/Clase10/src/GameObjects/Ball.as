package GameObjects 
{
	import starling.textures.Texture;
	import xxx.objects.Entity;
	import xxx.start.XXXStarling;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Ball extends Entity 
	{
		
		public function Ball() 
		{
			super();
			var tmp:Vector.<Texture> = new Vector.<Texture>();
			tmp.push(XXXStarling.assetManager.getTexture("basketball"));
			centerPivot = true;
			textures = tmp;
		}
		
	}

}