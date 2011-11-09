ig.module( 
  'game.screens.game_screen' 
)
.requires(
  'plugins.utils.screen',
  'game.levels.game',
  'plugins.graphics.painter'
)
.defines(function(){

GameScreen = Screen.extend({
  
  level: LevelGame,

  draw: function() {      
    Painter.fillRect(0, 0, 360, 440, 'white');
  }
});

});
