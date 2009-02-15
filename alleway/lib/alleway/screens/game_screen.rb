class GameScreen < Engine::Screen
  
  def initialize(game_window)
    @game_window = game_window
    @pad = Pad.new
  end
  
  def update
    @pad.move_left  if @game_window.button_down?(Gosu::Button::KbLeft)
    @pad.move_right if @game_window.button_down?(Gosu::Button::KbRight)
  end
  
  def draw
    @game_window.draw_quad(@pad.x, @pad.y, Gosu::white, 
                           @pad.x + 100, @pad.y, Gosu::white,
                           @pad.x, @pad.y + 20, Gosu::white,
                           @pad.x + 100, @pad.y + 20, Gosu::white)
  end
  
  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      exit
    end
  end
  
end