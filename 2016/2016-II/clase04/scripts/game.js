window.onload = function(){
	var game = 
		new Phaser.Game(900,600,Phaser.AUTO,'');

	game.state.add('Preload',Preload);
	game.state.add('Game',Game);
	game.state.start('Preload');

}