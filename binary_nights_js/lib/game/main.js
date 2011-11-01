ig.module( 
	'game.main' 
)
.requires(
	'impact.game',
	'impact.font',
	'plugins.utils.screen_state_manager'
)
.defines(function(){

MyGame = ig.Game.extend({
	
	screenManager: new ScreenStateManager(),
	
	
	init: function() {
		this.screenManager.add("title", {
			font: new ig.Font( 'media/04b03.font.png' ),

			draw: function() { 								
				var x = ig.system.width/2,
					  y = ig.system.height/2;
				
				this.font.draw("Binary Nights", x, y, ig.Font.ALIGN.CENTER );
		}});

		this.screenManager.switchTo("title");
	},
	
	update: function() {
		this.parent();
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
