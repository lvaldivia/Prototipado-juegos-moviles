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
	public class Limit extends DPhysicsGameObject 
	{
		
		public function Limit(_space:Space,_v2Position:Vec2) 
		{
			super("", BodyType.STATIC, _space, _v2Position);
		}
		
		override public function addToSpace():void {
			body.shapes.add(new Polygon(Polygon.rect(0, 0, stage.stageWidth, 30)));
			super.addToSpace();
		}
		
	}

}