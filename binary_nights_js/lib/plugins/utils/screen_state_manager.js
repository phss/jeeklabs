ig.module( 
  'plugins.utils.screen_state_manager' 
)
.defines(function(){

ScreenStateManager = ig.Class.extend({
  currentScreen: null,
  _screens: {},

  add: function(screenName, screenDefinition) {
    this._screens[screenName] = screenDefinition;
  },

  switchTo: function(screenName) {
    if (!this._screens[screenName]) {
      throw "No screen with name " + screenName;
    }
    this.currentScreen = this._screens[screenName];
  }
  
});


});
