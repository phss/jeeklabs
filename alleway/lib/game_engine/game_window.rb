class GameWindow < Gosu::Window
  
  def initialize(name, width, height)
    super(width, height, false)
    self.caption = name
    
    @main_screen = Gosu::Image.new(self, IMAGES_DIR + "/main_screen.png", 0)
  end
  
  def update
  end

  def draw
    @main_screen.draw(0, 0, 0)
  end
  
  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      exit
    end
  end
  
end