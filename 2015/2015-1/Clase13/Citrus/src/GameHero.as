package 
{
	import Box2D.Dynamics.Contacts.b2Contact;
	import citrus.math.MathVector;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.objects.platformer.box2d.Sensor;
	import citrus.physics.box2d.Box2DUtils;
	import citrus.physics.box2d.IBox2DPhysicsObject;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class GameHero extends Hero 
	{
		
		public function GameHero(name:String, params:Object=null) 
		{
			super(name, params);
			
		}
		
		override public function handleBeginContact(contact:b2Contact):void {
			super.handleBeginContact(contact);
			var collider:IBox2DPhysicsObject = Box2DUtils.CollisionGetOther(this, contact);
			if (contact.GetManifold().m_localPoint) 
			{                                
				var normalPoint:Point = new Point(contact.GetManifold().m_localPoint.x, contact.GetManifold().m_localPoint.y);
				var collisionAngle:Number = new MathVector(normalPoint.x, normalPoint.y).angle * 180 / Math.PI;
				if ((collisionAngle > 45 && collisionAngle < 135) || (collisionAngle > -30 && collisionAngle < 10 && collisionAngle != 0) || collisionAngle == -90 || (collisionAngle == 180))
				{
					if (collider is MovingPlatform && (collider as MovingPlatform).oneWay && collider.y < y){
						return;
					}
					_groundContacts.push(collider.body.GetFixtureList());
					_onGround = true;
					updateCombinedGroundAngle();
				}
			}
		}
		
	}

}