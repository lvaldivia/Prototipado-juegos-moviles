package 
{
	import citrus.core.State;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Crate;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends State 
	{
		[Embed(source="../assets/tmx/platformer.tmx", mimeType="application/octet-stream")]
		private var tileMap:Class;
		
		[Embed(source="../assets/tmx/Tileset.png")]
		private var tileView:Class;
		public function Game() 
		{
			super();
			var objects:Array = [Platform, Proto, Coin,MovingPlatform,Enemy, Crate];
		}
		
		override public function initialize():void {
			super.initialize();
			var box2d:Box2D = new Box2D("box2d");
			add(box2d);
			box2d.visible = true;
			var bitmap:Bitmap = new tileView();
			bitmap.name = 'Tileset.png';
			ObjectMaker2D.FromTiledMap(XML(new tileMap()), [bitmap]);
			var hero:Proto = getFirstObjectByType(Proto) as Proto;
			view.camera.setUp(hero, new Rectangle(0, 0, 1472, 576) ,
							new Point(.33, .5),  new Point(.25, .05))
		}
		
	}

}