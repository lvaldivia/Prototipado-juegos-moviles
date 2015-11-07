package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.space.Space;
	import Utils.physics.DPhysicsGameObject;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Pipe extends DPhysicsGameObject 
	{
		private var _giveScore:Boolean;
		public function Pipe(_top:Boolean,_space:Space,v2:Vec2 = null) 
		{
			var type:String = _top ? "pipe0.png" : "pipe1.png";
			giveScore = false;
			super(type, BodyType.KINEMATIC, _space, v2);
		}
		
		override public function addToSpace():void{
			body.shapes.add(new Polygon(Polygon.rect(0, 0, 50, 320)));
			
			super.addToSpace();
			//body.velocity = new Vec2( 0, 0);
			_body.velocity.x = -150;
		}
		
		override public function update():void{
			super.update();
			body.position.x -= 2;
			trace(body.position.x);
		}
		
		public function get giveScore():Boolean 
		{
			return _giveScore;
		}
		
		public function set giveScore(value:Boolean):void 
		{
			_giveScore = value;
		}
		
	}

}