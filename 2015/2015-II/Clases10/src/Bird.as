package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Circle;
	import nape.space.Space;
	import treefortress.sound.SoundAS;
	import Utils.input.DMouse;
	import Utils.objects.DGameObject;
	import Utils.physics.DPhysicsGameObject;
	import Utils.start.DStarling;
	
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
			this.alignPivot();
			super.addToSpace();
		}
		
		override public function update():void{
			super.update();
			if(!alife){
				body.applyImpulse(new Vec2(0, 100));
			}
			
		}
		
		public function fap():void 
		{
			if(alife){
				if (DMouse.isDown) {
					SoundAS.play("flap");
					DMouse.isDown = false;
					body.velocity.y = -300;
				}	
			}
			
		}
		
	}

}