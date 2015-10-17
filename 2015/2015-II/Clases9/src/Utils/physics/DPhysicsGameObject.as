package Utils.physics 
{
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.space.Space;
	import Utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class DPhysicsGameObject extends DGameObject 
	{
		protected var v2Position:Vec2;
		protected var space:Space;
		protected var bodyType:BodyType;
		protected var _body:Body;
		
		public function DPhysicsGameObject(clip:String, _bodyType:BodyType, _space:Space, 
							_v2Position:Vec2 = null, _centerPivot:Boolean = true, 
							_life:int=100,_alife:Boolean = true ) 
		{
			super(clip,_centerPivot,_life,alife);
			space = _space;
			bodyType = _bodyType;
			v2Position = _v2Position;
		}
		
		
		override public function init():void{
			super.init();
			trace(v2Position);
			if(v2Position!=null){
				x = v2Position.x;
				y = v2Position.y;
			}
			body = new Body(bodyType, v2Position);
			addToSpace();
		}
		
		public function addToSpace():void 
		{
			body.space = space;
		}
		
		override public function update():void{
			x = body.position.x;
			y = body.position.y;
			super.update();
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