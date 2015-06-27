package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import xxx.physics.PhysicEntity;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Bird extends PhysicEntity 
	{
		
		public function Bird(_space:Space, _v2Position:Vec2=null) 
		{
			bodyType = BodyType.DYNAMIC;
			super(_space, _v2Position);
			centerPivot = true;
		}
		
		override public function init():void {
			super.init();
			body.shapes.add(new Polygon(Polygon.box(20, 20)));
			body.shapes.at(0).sensorEnabled = true;
			addToSpace();
		}
		
		override public function update():void {
			
		}
		
	}

}