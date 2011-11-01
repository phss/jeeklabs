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

  draw: function() {                
    var x = ig.system.width/2,
        y = ig.system.height/2;
        
    this.font.draw("Binary Nights", x, y, ig.Font.ALIGN.CENTER );
  }
});

});
