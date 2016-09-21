Menu = function(){}

Menu.prototype = {
	create:function(){
		this.background = 
			this.game.add.sprite(
				this.game.world.centerX,
				this.game.world.centerY
				,'menu');
		this.background.anchor.setTo(0.5);
		this.background.inputEnabled = true;
		this.background.events.onInputDown.add(
			this.goGame,this);
	},
	goGame:function(){
		this.game.state.start('Game');
	}
}