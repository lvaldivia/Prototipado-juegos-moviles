package  
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import xxx.physics.PhysicEntity;
	
	/**
	 * ...
	 * @author Luis
	 */
	public class Pipe extends PhysicEntity 
	{
		public var giveScore:Boolean = false;
		public function Pipe(_space:Space, _v2Position:Vec2=null) 
		{
			bodyType = BodyType.KINEMATIC;
			super(_space, _v2Position);
		}
		
		override public function init():void {
			super.init();
			body.shapes.add(new Polygon(Polygon.rect(0, 0, 30, 480)));
			addToSpace();
		}
		
		override public function update():void {
			body.position.x -= 2;
		}
		
	}

}