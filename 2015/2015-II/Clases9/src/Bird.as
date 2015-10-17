package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Circle;
	import nape.space.Space;
	import Utils.input.DMouse;
	import Utils.objects.DGameObject;
	import Utils.physics.DPhysicsGameObject;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Bird extends DPhysicsGameObject 
	{
		
		public function Bird(_space:Space,_position:Vec2=null) 
		{
			super("fly0", BodyType.DYNAMIC, _space, _position);
		}
		
		override public function addToSpace():void{
			body.shapes.push(new Circle(17));
			super.addToSpace();
		}
		
		public function fap():void 
		{
			if(DMouse.isDown){
				DMouse.isDown = false;
				body.velocity.y = -300;
			}
		}
		
	}

}