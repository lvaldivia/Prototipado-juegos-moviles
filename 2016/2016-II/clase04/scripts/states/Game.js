Game = function(){}

Game.prototype = {
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

		this.elapsed = 0;
		this.bullets = this.game.add.group();
	},
	update:function(){
		this.player.body.velocity.x = 0;
		this.player.body.velocity.y = 0;
		if(this.keys.left.isDown){
			this.player.body.velocity.x = -200;
		}
		if(this.keys.right.isDown){
			this.player.body.velocity.x = 200;
		}

		this.elapsed+=this.game.time.elapsed;
		if(this.game.input.keyboard.isDown(
			Phaser.Keyboard.Z)){
			if(this.elapsed>=500){
				this.elapsed = 0;
				this.generateBullets();	
			}
		}
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
		this.game.physics.arcade.enable(bullet);
		bullet.body.velocity.y = -100;
		bullet.body.allowGravity = false;
		bullet.checkWorldBounds = true;
		bullet.onOutOfBoundsKill = true;
	}
}