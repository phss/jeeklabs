class IntroScreen < Engine::Screen
  
  def initialize(game_window)
    @game_window = game_window
    @intro_image = Gosu::Image.new(game_window, IMAGES_DIR + "/main_screen.png", 0)
  end
  
  def draw
    @intro_image.draw(0, 0, 0)
  end
  
  def button_down(id)
    exit
  end
  
end