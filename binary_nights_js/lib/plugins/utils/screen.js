ig.module( 
  'plugins.utils.screen' 
)
.defines(function(){

Screen = ig.Class.extend({
  level: null, // Should be defined by the implementation

  load: function(game) { game.loadLevel(this.level); },

  update: function() {},

  draw: function() {}
  
});


});
