window.onload = function(){
	var game = 
	new Phaser.Game(900,600,Phaser.AUTO,'',
	{
		preload:preload, create:create, update:update
	}),
		elapsed = 0;

	function preload(){
		game.load.image('sea','assets/sea.png');
		game.load.spritesheet(
				"green_enemy","assets/enemy.png",
				32,32,4);
		game.scale.scaleMode = 
			Phaser.ScaleManager.SHOW_ALL;
		game.scale.pageAlignHorizontally = true;
		game.scale.pageAlignVertically = true;
	}

	function create(){
		var sea = game.add.tileSprite(
			0,0,game.width,game.height,'sea');

		sea.autoScroll(0,-150);

		game.physics.startSystem(
			Phaser.Physics.ARCADE);
		game.physics.arcade.gravity.y = 1000;
	}

	function update(){
		elapsed +=game.time.elapsed;
		if(elapsed>=1000){
			elapsed = 0;
			createEnemy();
		}
	}

	function createEnemy(){
		var enemy = game.add.sprite(0,50,'green_enemy');
		enemy.animations.add('flying',[0,1,2]);
		enemy.animations.play("flying",12,true);
		enemy.anchor.setTo(0.5);
		enemy.x = game.rnd.realInRange(
			enemy.width * 0.5,
			game.width - (enemy.width*0.5));
		enemy.scale.setTo(2);
		game.physics.arcade.enable(enemy);
		enemy.checkWorldBounds = true;
		enemy.outOfBoundsKill = true;
		/*enemy.events.onOutOfBounds.add(function(){
			console.log("muere");
		});*/
	}

}