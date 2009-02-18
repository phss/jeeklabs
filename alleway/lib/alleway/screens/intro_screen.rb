class IntroScreen < Engine::Screen
  
  def initialize(game_window)
    super(game_window)
    @intro_image = Gosu::Image.new(game_window, IMAGES_DIR + "/main_screen.png", 0)
  end
  
  def draw
    @intro_image.draw(0, 0, 0)
  end
  
  def button_down(id)
    @game_window.go_to("Game")
  end
  
end