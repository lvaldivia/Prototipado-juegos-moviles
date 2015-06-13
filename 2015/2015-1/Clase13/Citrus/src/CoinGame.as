package 
{
	import Box2D.Dynamics.Contacts.b2Contact;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.physics.box2d.Box2DUtils;
	import citrus.physics.box2d.IBox2DPhysicsObject;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class CoinGame extends Coin 
	{
		
		public function CoinGame(name:String, params:Object=null) 
		{
			super(name, params);
			
		}
		
		override public function update(timeDelta:Number):void {
			
		}
		
		override public function handleBeginContact(contact:b2Contact):void {
			//super.handleBeginContact(contact);
			var collider:IBox2DPhysicsObject  = Box2DUtils.CollisionGetOther(this,contact);
			if (collider is Hero || collider is Enemy) {
				kill = true;
			}
		}
		
	}

}