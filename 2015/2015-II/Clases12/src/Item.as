package 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import Utils.physics.DPhysicsGameObject;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Item extends DPhysicsGameObject 
	{
		public var isEnemy:Boolean;
		private var key:String;
		public function Item(clip:String, _space:Space) 
		{
			super(clip, BodyType.DYNAMIC, _space);
			key = clip;
			if(clip == "Obstacle1" || clip =="Obstacle2"){
				isEnemy = true;
			}
		}
		
		override public function addToSpace():void {

			if(!isEnemy){
				body.shapes.push(new Polygon(Polygon.rect(0, 0, 30, 30)));
			}else{
				if(key == "Obstacle1"){
					body.shapes.push(new Polygon(Polygon.rect(0, 0, 139, 53)));
				}
				if(key == "Obstacle2"){
					body.shapes.push(new Polygon(Polygon.rect(0, 0, 79, 71)));
				}
			}
			super.addToSpace();
			body.position = new Vec2(stage.stageWidth, Math.random() * stage.stageHeight);
		}
		
		override public function update():void { 
			super.update();
			body.position.x -= 5;
		}
		
		
	}

}