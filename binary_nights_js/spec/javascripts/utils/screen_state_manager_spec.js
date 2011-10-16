describe("ScreenStateManager", function() {
  var manager;

  beforeEach(function() {
    manager = new ScreenStateManager();
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
      var screenDef = { level: "blah" }
      manager.add("some screen", screenDef);

      manager.switchTo("some screen");

      expect(manager.currentScreen).toEqual(screenDef);
    });
  });

});