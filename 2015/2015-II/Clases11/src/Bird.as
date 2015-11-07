package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Circle;
	import nape.space.Space;
	import treefortress.sound.SoundAS;
	import Utils.input.DKeyboard;
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
		private var isInverted:Boolean;
		private var anti_gravity:Vec2;
		public function Bird(_space:Space,_position:Vec2=null) 
		{
			anti_gravity = new Vec2();
			super("fly0", BodyType.DYNAMIC, _space, _position);
		}
		
		override public function addToSpace():void{
			body.shapes.push(new Circle(17));
			this.alignPivot();
			body.allowRotation = false;
			body.velocity = new Vec2();
			super.addToSpace();
		}
		
		override public function update():void{
			super.update();
			if(!alife){
				body.applyImpulse(new Vec2(0, 100));
			}
			//body.position.x = DMouse.x
			body.velocity.y = 0;
			if(DKeyboard.upPress){
				//isInverted = true;
				body.velocity.y = -150;
				//anti_gravity.y = -24;
			}
			if (DKeyboard.downPress) {
				body.velocity.y = 150;
				//isInverted = false;
				//anti_gravity.y = 10;
			}
		}
		
		public function fap():void 
		{
			if(alife){
				if (DMouse.isDown) {
					SoundAS.play("flap");
					DMouse.isDown = false;
					body.velocity.y = -300*scaleY;
				}	
			}
			
		}
		
	}

}