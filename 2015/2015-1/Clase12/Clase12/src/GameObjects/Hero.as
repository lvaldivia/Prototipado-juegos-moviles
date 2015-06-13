package GameObjects 
{
	import nape.dynamics.InteractionGroup;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import xxx.input.XXXKeyboard;
	import xxx.physics.PhysicEntity;
	import xxx.start.XXXStarling;
	import xxx.time.XXXTime;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Hero extends PhysicEntity 
	{
		private var elapsed:Number = 0;
		private var _isJumping:Boolean;
		public  var onCreateBullet:Function;
		
		public function Hero(_space:Space, _v2Position:Vec2=null) 
		{
			super(_space, _v2Position);
			centerPivot = true;
			textures = XXXStarling.assetManager.getTextureAtlas("assets").getTextures("mc_Player_Stand00");
			bodyType = BodyType.DYNAMIC;
		}
		
		override public function init():void {
			super.init();
			body.shapes.add(new Polygon(Polygon.box(50, 50)));
			body.group = new InteractionGroup(true);
			addToSpace();
		}
		
		override public function update():void {
			super.update();
			if (XXXKeyboard.rightPress) {
				scaleX = 1;
				body.position.x += 10;
			}
			if (XXXKeyboard.leftPress) {
				scaleX = -1;
				body.position.x -= 10;
			}
			elapsed += XXXTime.dt;
			if (XXXKeyboard.upPress) {
				if (!isJumping) {
					isJumping = true;
					body.applyImpulse(new Vec2(0, -1000));
				}
				
				//if (elapsed >= 0.3) {
					//elapsed = 0;
					//onCreateBullet(body.position.x, body.position.y);
				//}
			}
		}
		
		public function get isJumping():Boolean 
		{
			return _isJumping;
		}
		
		public function set isJumping(value:Boolean):void 
		{
			_isJumping = value;
		}
		
	}

}