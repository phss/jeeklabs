ig.module( 
  'game.screens.title_screen' 
)
.requires(
  'plugins.utils.screen',
  'game.levels.title',
  'impact.font'
)
.defines(function(){

TitleScreen = Screen.extend({
  
  level: LevelTitle,
  font: new ig.Font( 'media/04b03.font.png' ),

  load: function(game) {
    this.parent(game);

    ig.input.bind(ig.KEY.ENTER, 'go_to_game');

  },

  update: function() {
    if (ig.input.pressed('go_to_game')) {
      ig.screenManager.switchTo('game');
    }    
  },

  draw: function() {                
    var x = ig.system.width/2,
        y = ig.system.height/2;
        
    this.font.draw("Binary Nights", x, y, ig.Font.ALIGN.CENTER );
  }
});

});
