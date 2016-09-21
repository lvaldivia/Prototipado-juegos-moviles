Preload = function(){}

Preload.prototype = {
	preload:function(){
		this.game.load.image('sea','assets/sea.png');
		this.game.load.image(
			'bullet','assets/bullet.png');
		this.game.load.image('menu',
			'assets/titlepage.png');
		this.game.load.spritesheet(
				"green_enemy","assets/enemy.png",
				32,32,4);
		this.game.load.spritesheet(
			"explosion","assets/explosion.png",
			32,32,6
		);
		this.game.load.audio('explosion_sound',
			"assets/explosion.ogg");
		this.game.load.audio('player_fire',
			"assets/player-fire.ogg");

		this.game.load.spritesheet(
			'player', 'assets/player.png', 64, 64,4);
		this.game.scale.scaleMode = 
			Phaser.ScaleManager.SHOW_ALL;
		this.game.scale.pageAlignHorizontally = true;
		this.game.scale.pageAlignVertically = true;
	},
	create:function(){
		this.game.state.start('Menu');
	}

	
}