package xxx.physics 
{
	import nape.callbacks.CbType;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.space.Space;
	import xxx.objects.Entity;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class PhysicEntity extends Entity 
	{
		protected var _body:Body;
		protected var bodyType:BodyType;
		protected var space:Space;
		protected var v2Position:Vec2;
		
		public function PhysicEntity(_space:Space, _v2Position:Vec2=null) 
		{
			super();
			v2Position = _v2Position;
			space = _space;
		}
		
		override public function init():void {
			super.init();
			if (v2Position != null) {
				position.x = v2Position.x;
				position.y = v2Position.y;
			}
			body = new Body(bodyType, v2Position);
		}
		
		public function addCollisionType(cb:CbType):void {
			body.cbTypes.add(cb);
		}
		
		public function addToSpace():void {
			space.bodies.add(body);
		}
		
		override public function destroy():void {
			super.destroy();
			space.bodies.remove(body);
		}
		
		override public function update():void {
			super.update();
			position.x = body.position.x;
			position.y = body.position.y;
			rotation = body.rotation;
		}
		
		public function get body():Body 
		{
			return _body;
		}
		
		public function set body(value:Body):void 
		{
			_body = value;
		}
		
		
		
	}

}