package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import starling.textures.Texture;
	import Utils.input.DKeyboard;
	import Utils.physics.DPhysicsGameObject;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Player extends DPhysicsGameObject 
	{
		
		public function Player(_space:Space, _v2Position:Vec2=null, _centerPivot:Boolean=true, _life:int=100, _alife:Boolean=true) 
		{
			super("stand", BodyType.DYNAMIC, _space, _v2Position, _centerPivot, _life, _alife);
			
		}
		
		override public function init():void{
			super.init();
			alignPivot();
		}
		
		override public function addToSpace():void{
			body.shapes.add(new Polygon(Polygon.rect(-33, -41, 66, 82)));
			body.allowRotation = false;
				
			addState("walking", DStarling.assetsManager.getTextures("alienYellow_walk"));
			addState("stand",DStarling.assetsManager.getTextures("stand.png"));
			super.addToSpace();
		}
		
		override public function update():void{
			super.update();
			if (DKeyboard.leftPress) {
				startState("walking");
				body.position.x -= 2;
				this.scaleX = -1;
			}
			if (DKeyboard.rightPress) {
				startState("walking");	
				this.scaleX = 1;
				body.position.x += 2;
			}
			if(!DKeyboard.leftPress && !DKeyboard.rightPress){
				startState("stand");
			}
		}
		
	}

}