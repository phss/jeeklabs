ig.module( 
	'game.main' 
)
.requires(
	'impact.game',
	'impact.font',
	'plugins.utils.screen_state_manager',
	'game.screens.title_screen',
	'game.screens.game_screen'
)
.defines(function(){

MyGame = ig.Game.extend({
	
	screenManager: null,
	
	init: function() {
		ig.screenManager = new ScreenStateManager(this);
		ig.screenManager.add("title", new TitleScreen());
		ig.screenManager.add("game", new GameScreen());

		ig.screenManager.switchTo("title");
	},
	
	update: function() {
		this.parent();

		ig.screenManager.update();
	},
	
	draw: function() {
		this.parent();

		ig.screenManager.draw();
	}
});


// Start the Game with 60fps, a resolution of 320x240, scaled
// up by a factor of 2
ig.main( '#canvas', MyGame, 60, 320, 240, 2 );

});
