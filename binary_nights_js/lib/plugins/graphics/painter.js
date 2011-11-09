ig.module( 
  'plugins.graphics.painter' 
)
.defines(function(){

Painter = new (ig.Class.extend({
  
  fillRect: function(x, y, width, height, color) {
    var ctx = ig.system.context;
    var s = ig.system.scale;
    var scaledX = (x - ig.game.screen.x) * s;
    var scaledY = (y - ig.game.screen.y) * s;
    var scaledWidth = width * s;
    var scaledHeight = height * s;
    ctx.save();
    ctx.fillStyle = color;
    ctx.fillRect(scaledX, scaledY, scaledWidth, scaledHeight);
    ctx.restore();  
  }

}))();

});
