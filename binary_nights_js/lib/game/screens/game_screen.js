ig.module( 
  'game.screens.game_screen' 
)
.requires(
  'plugins.utils.screen',
  'game.levels.game',
  'impact.font'
)
.defines(function(){

GameScreen = Screen.extend({
  
  level: LevelGame,
  font: new ig.Font( 'media/04b03.font.png' ),

  draw: function() {                
    var x = ig.system.width/2,
        y = ig.system.height/2;
        
    this.font.draw("This is the game...almost", x, y, ig.Font.ALIGN.CENTER );
  }
});

});
