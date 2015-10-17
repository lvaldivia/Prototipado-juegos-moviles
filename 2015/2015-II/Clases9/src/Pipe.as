package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.space.Space;
	import Utils.physics.DPhysicsGameObject;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Pipe extends DPhysicsGameObject 
	{
		
		public function Pipe(_space:Space,v2:Vec2 = null) 
		{
			super("fly0", BodyType.KINEMATIC, _space, v2);
		}
		
		override public function addToSpace():void{
			body.shapes.add(new Polygon(Polygon.box(30, 480)));
			super.addToSpace();
		}
		
		override public function update():void{
			super.update();
			body.position.x -= 2;
		}
		
	}

}