class IntroScreen < Engine::Screen
  
  def initialize(game_window)
    super(game_window)
  end
  
  def initialize_representations
    [Engine::ImageRepresentation.new(@game_window, Engine::GameObject.new, IMAGES_DIR + "/main_screen.png")]
  end
  
  def button_down(id)
    @game_window.go_to("Game")
  end
  
end