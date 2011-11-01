describe("ScreenStateManager", function() {
  var manager, game;

  beforeEach(function() {
    game = jasmine.createSpy("mock game");
    manager = new ScreenStateManager(game);
  });

  describe("(configuration)", function() {
    it("should have no screens and current state when initialized", function() {
      expect(manager._screens).toEqual({});
      expect(manager.currentScreen).toBeNull();
    });

    it("should add new screen", function() {
      var screenDef = { level: "blah" }
      manager.add("some screen", screenDef)

      expect(manager._screens).toEqual({ "some screen": screenDef });
    });
  });

  describe("(managing state)", function() {
    it("should throw error if switching to inexistent screen", function() {
      expect(function() {manager.switchTo("inexisting")}).toThrow();
    });

    it("should switch to screen", function() {
      var screen = { load: function(g) {} };
      spyOn(screen, "load");
      manager.add("some screen", screen);

      manager.switchTo("some screen");

      expect(manager.currentScreen).toEqual(screen);
      expect(screen.load).toHaveBeenCalledWith(game);
    });
  });

});