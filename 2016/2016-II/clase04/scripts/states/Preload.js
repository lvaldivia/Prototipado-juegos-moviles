Preload = function(){}

Preload.prototype = {
	preload:function(){
		this.game.load.image('sea','assets/sea.png');
		this.game.load.image(
			'bullet','assets/bullet.png');
		this.game.load.spritesheet(
				"green_enemy","assets/enemy.png",
				32,32,4);
		this.game.load.spritesheet(
			'player', 'assets/player.png', 64, 64,4);
		this.game.scale.scaleMode = 
			Phaser.ScaleManager.SHOW_ALL;
		this.game.scale.pageAlignHorizontally = true;
		this.game.scale.pageAlignVertically = true;
	},
	create:function(){
		this.game.state.start('Game');
	}

	
}