package 
{
	import flash.system.ImageDecodingPolicy;
	import nape.callbacks.CbEvent;
	import nape.callbacks.CbType;
	import nape.callbacks.InteractionCallback;
	import nape.callbacks.InteractionListener;
	import nape.callbacks.InteractionType;
	import nape.geom.Vec2;
	import starling.display.Image;
	import starling.display.Sprite;
	import Utils.input.DKeyboard;
	import Utils.objects.DGroup;
	import Utils.physics.DPhysicWorld;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends DPhysicWorld 
	{
		private var skyLayer:Sprite;
		private var mountainLayer:Sprite;
		private var flowerLayer:Sprite;
		private var hero:Player;
		private var elements:Vector.<String>;
		private var elapsed:Number;
		private var elementGroup:DGroup;
		private var enemyCollision:CbType;
		private var heroGroup:CbType;
		public function Game() 
		{
			elapsed = 0;
			super("", new Vec2(0, 0),true);
		}
		
		override public function init():void{
			super.init();
			
			DKeyboard.init(stage);
			skyLayer = new Sprite();
			addChild(skyLayer);
			mountainLayer = new Sprite();
			addChild(mountainLayer);
			flowerLayer = new Sprite();
			addChild(flowerLayer);
			
			for (var i:int = 0; i < 2; i++) 
			{
				var bg1:Image = new Image(DStarling.assetsManager.getTexture("bgLayer1"));
				skyLayer.addChild(bg1);
				bg1.x = i * bg1.width;
				bg1.y = stage.stageHeight - bg1.height;
				
				var bg2:Image = new Image(DStarling.assetsManager.getTexture("bgLayer2"));
				mountainLayer.addChild(bg2);
				bg2.x = i * bg2.width;
				bg2.y = stage.stageHeight - bg2.height;
				
				var bg3:Image = new Image(DStarling.assetsManager.getTexture("bgLayer3"));
				flowerLayer.addChild(bg3);
				bg3.x = i * bg3.width;
				bg3.y = stage.stageHeight - bg3.height;
			}
			hero = new Player(space);
			addChild(hero);
			
			elements = new Vector.<String>();
			elements.push("item1", "item2", "item3", "Obstacle1", "Obstacle2", "mushroom");
			elementGroup = new DGroup();
			addChild(elementGroup);
			
			heroGroup = new CbType();
			enemyCollision = new CbType();
			
			hero.addCollisionType(heroGroup);
			var interactionListener:InteractionListener = new InteractionListener(CbEvent.BEGIN,
					InteractionType.ANY, heroGroup, enemyCollision, handleCollision);
			space.listeners.add(interactionListener);
		}
		
		private function handleCollision(interactionCallback:InteractionCallback):void 
		{
			if(interactionCallback.int2.userData.panchito_potato is Item){
				var item:Item = interactionCallback.int2.userData.panchito_potato as Item;
				//if item.isSpecial hace algo
				if(item.isEnemy){
					//si player tiene item especial // hace algo
				}else{
					//gana puntaje
				}
				elementGroup.removeChild(item);
			}
		}
		
		override public function update():void{
			super.update();
			hero.update();
			elapsed += deltaTime;
			if(elapsed>=0.5){
				elapsed = 0;
				var index:int = Math.floor(Math.random() * (elements.length - 1));
				var item:Item = new Item(elements[index], space);
				elementGroup.addChild(item);
				item.addCollisionType(enemyCollision);
			}
			for (var i:int = 0; i < elementGroup.numChildren; i++) 
			{
				var a:Item = elementGroup.getChildAt(i) as Item;
				a.update();
			}
			skyLayer.x -= 0.5;
			mountainLayer.x -= 0.2
			flowerLayer.x -= 0.5;
			if(skyLayer.x< -skyLayer.width){
				skyLayer.x = skyLayer.width;
			}
			if(mountainLayer.x< -mountainLayer.width){
				mountainLayer.x = mountainLayer.width;
			}
			if(flowerLayer.x < -flowerLayer.width){
				flowerLayer.x = flowerLayer.width;
			}
		}
		
	}
	
	

}