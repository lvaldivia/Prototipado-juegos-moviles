package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import Utils.input.DKeyboard;
	import Utils.physics.DPhysicsGameObject;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Player extends DPhysicsGameObject 
	{
		
		public function Player(_space:Space) 
		{
			super("fly_00",BodyType.DYNAMIC, _space, new Vec2(0,150));
		}
		
		override public function addToSpace():void{
			body.shapes.push(new Polygon(Polygon.rect(0, 0, 165, 80)));
			super.addToSpace();
			body.allowRotation = false;
		}
		
		override public function update():void{
			super.update();
			if(DKeyboard.upPress){
				body.position.y -= 5;
			}
			if(DKeyboard.downPress){
				body.position.y += 5;
			}
			//if()
		}
		
	}

}