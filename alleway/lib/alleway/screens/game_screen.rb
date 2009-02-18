class GameScreen < Engine::Screen
  
  def initialize(game_window)
    @game_window = game_window
    @pad_representation = QuadRepresentation.new(game_window, Pad.new(PAD_CONFIG), Gosu::white)
    @pad_representation.when_key(Gosu::Button::KbLeft) { move_left }
    @pad_representation.when_key(Gosu::Button::KbRight) { move_right }    
  end
  
  def update
    @pad_representation.update
  end
  
  def draw
    @pad_representation.draw
  end
  
  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      exit
    end
  end
  
end