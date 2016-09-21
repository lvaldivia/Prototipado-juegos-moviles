Game = function(){}

Game.prototype = {
	init:function(score){
		this.score = score || 0;
	},
	create:function(){
		this.background = this.game.add.tileSprite(0,0,
			this.game.width,this.game.height,'sea');
		this.background.autoScroll(0,-150);
		this.player = this.game.add.sprite(
			this.game.world.centerX,
			0,
			"player"
		);
		this.player.anchor.setTo(0.5);
		this.player.y = this.game.height - this.player.height;
		this.player.animations.add('flying',[0,1,2]);
		this.player.animations.play("flying",12,true);
		this.keys = 
			this.game.input.keyboard.createCursorKeys();

		this.game.physics.startSystem(
				Phaser.Physics.ARCADE);
		this.game.physics.arcade.gravity.y = 500;
		this.game.physics.arcade.enable(this.player);
		this.player.body.allowGravity = false;
		this.player.body.collideWorldBounds = true;
		this.player.body.immovable = true;
		this.player.body.setSize(this.player.width,
			this.player.height,0,
			this.player.height*0.5);

		this.elapsed = 0;
		this.bullets = this.game.add.group();
		this.bullets.enableBody = true;

		this.elapsedGenerationEnemy = 0;
		this.enemys = this.game.add.group();
		this.enemys.enableBody = true;
		this.totalTimeGenerationTime = 2000;

		this.enemyTypes = ['green_enemy'];
		this.player_fire = this.game.add.audio('player_fire',1,false);
		this.explosion_sound = 
			this.game.add.audio('explosion_sound',1,false);

		var style = {
			font : '32px Arial',
			fill : "#fff"
		};
		this.scoreTxt = this.game.add.text(
			100,100,'Score: '+this.score, style
		);
		this.scoreTxt.anchor.setTo(0.5);

	},
	update:function(){
		this.player.body.velocity.x = 0;
		this.player.body.velocity.y = 0;
		if(this.keys.left.isDown){
			this.player.body.velocity.x = -400;
		}
		if(this.keys.right.isDown){
			this.player.body.velocity.x = 400;
		}

		this.elapsed+=this.game.time.elapsed;
		this.elapsedGenerationEnemy+=this.game.time.elapsed;
		if(this.elapsedGenerationEnemy>=this.totalTimeGenerationTime){
			this.elapsedGenerationEnemy = 0;
			this.generateEnemies();
		}
		if(this.game.input.keyboard.isDown(
			Phaser.Keyboard.Z)){
			if(this.elapsed>=500){
				this.player_fire.play();
				this.elapsed = 0;
				this.generateBullets();	
			}
		}
		this.enemys.forEachAlive(function(enemy){
			if(enemy.y>this.game.height){
				enemy.kill();
			}
		}, this);

		this.game.physics.arcade.collide(this.player,
			this.enemys,this.destroyElements,null,this);

		this.game.physics.arcade.collide(this.bullets,
			this.enemys,this.destroyAll,null,this);

	},
	
	destroyAll:function(sp1,sp2){
		var explosion = this.game.add.sprite(
			sp2.x, sp2.y,'explosion'
		);
		this.explosion_sound.play();
		sp1.kill();
		sp2.kill();
		this.score+=10;
		this.scoreTxt.text ="Score: "+this.score;
		explosion.anchor.setTo(0.5);
		explosion.animations.add("explosion");
		explosion.animations.play(
			"explosion",12,false,true);
	},

	destroyElements:function(sp1, sp2){
		sp1.kill();
		sp2.kill();
		this.game.state.start("Game",true,false,this.score);
	},

	generateEnemies:function(){
		var index = this.game.rnd.integerInRange(0,
			this.enemyTypes.length-1);
		var enemy = this.game.add.sprite(0,0,
				this.enemyTypes[index]);
		enemy.anchor.setTo(0.5);
		enemy.y = -enemy.height;
		enemy.x = this.game.rnd.realInRange(
			enemy.width*0.5,
			this.game.width - (enemy.width*0.5));
		this.enemys.add(enemy);
		enemy.body.velocity.y = 100;

	},
	generateBullets:function(){
		var bullet = this.bullets.getFirstDead();
		if(!bullet){
			bullet = this.game.add.sprite(
				this.player.x,this.player.y,
				'bullet'
			);
			this.bullets.add(bullet);
		}else{
			bullet.reset(this.player.x,this.player.y);
		}
		bullet.anchor.setTo(0.5);
		//this.game.physics.arcade.enable(bullet);
		bullet.body.velocity.y = -100;
		bullet.body.allowGravity = false;
		bullet.checkWorldBounds = true;
		bullet.onOutOfBoundsKill = true;
	}
}