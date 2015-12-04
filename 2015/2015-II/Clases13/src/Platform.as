package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import Utils.physics.DPhysicsGameObject;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Platform extends DPhysicsGameObject
	{
		
		public function Platform(_space:Space,position:Vec2) 
		{
			super("grassMid.png", BodyType.STATIC, _space, position);
		}
		
		override public function addToSpace():void{
			body.shapes.add(new Polygon(Polygon.rect(0, 0, 70, 70)));
			super.addToSpace();
		}
		
	}

}