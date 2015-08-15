package 
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite 
	{
		
		public function Game() 
		{
			super();
			
		}
		
		public function start(_asset:AssetManager):void 
		{
			var bg:Image = new Image(_asset.getTexture("background"));
			addChild(bg);
			var borrachito:MovieClip = new MovieClip(
						_asset.getTextures("walking_guy00"),1);
			addChild(borrachito);
			Starling.juggler.add(borrachito);
			
			var borrachito:MovieClip = new MovieClip(
						_asset.getTextures("walking_guy00"),1);
			addChild(borrachito);
			borrachito.x = 350;
			borrachito.scaleX = -1;
			Starling.juggler.add(borrachito);
		}
		
	}

}