describe("Screen", function() {

  beforeEach(function() {
    screen = new Screen();
  });

  it("should have stub update and draw methods", function() {
    screen.update();
    screen.draw();
  });

  it("should load level", function() {
    var game = { loadLevel: function() {} };
    spyOn(game, "loadLevel");

    screen.level = "some level";
    screen.load(game);

    expect(game.loadLevel).toHaveBeenCalledWith("some level");
  });

});