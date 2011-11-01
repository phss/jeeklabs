ig.module( 
	'game.main' 
)
.requires(
	'impact.game',
	'impact.font',
	'plugins.utils.screen_state_manager',
	'game.screens.title_screen'
)
.defines(function(){

MyGame = ig.Game.extend({
	
	screenManager: null,
	
	init: function() {
		this.screenManager = new ScreenStateManager(this);
		this.screenManager.add("title", new TitleScreen());

		this.screenManager.switchTo("title");
	},
	
	update: function() {
		this.parent();

		this.screenManager.currentScreen.update();
	},
	
	draw: function() {
		this.parent();

		this.screenManager.currentScreen.draw();
	}
});


// Start the Game with 60fps, a resolution of 320x240, scaled
// up by a factor of 2
ig.main( '#canvas', MyGame, 60, 320, 240, 2 );

});
