package GameObjects 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.space.Space;
	import starling.textures.Texture;
	import xxx.physics.PhysicEntity;
	import xxx.start.XXXStarling;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Ball extends PhysicEntity 
	{
		
		public function Ball(_space:Space, _v2Position:Vec2=null) 
		{
			super(_space,_v2Position);
			var tmp:Vector.<Texture> = new Vector.<Texture>();
			tmp.push(XXXStarling.assetManager.getTexture("basketball"));
			centerPivot = true;
			textures = tmp;
			bodyType = BodyType.DYNAMIC;
		}
		
		override public function init():void {
			super.init();
			body.shapes.add(new Circle(50, null, new Material(20)));
			addToSpace();
			//body.position.y = -500;
			trace(body.position);
		}
	
		
	}

}