package GameObjects 
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
	public class Floor extends PhysicEntity 
	{
		
		public function Floor(_space:Space, _v2Position:Vec2=null) 
		{
			super(_space, _v2Position);
			bodyType = BodyType.STATIC;
		}
		
		override public function init():void {
			super.init();
			body.shapes.add(new Polygon(Polygon.rect(0, stage.stageHeight, 
						stage.stageWidth, 50)));
			addToSpace();
		}
		
	}

}