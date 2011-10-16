describe("ScreenStateManager", function() {
  var manager;

  beforeEach(function() {
    manager = new ScreenStateManager();
  });

  it("should have no screens and current state when initialized", function() {
    expect(manager.screens).toEqual({});
    expect(manager.currentScreen).toBeNull();
  });

});