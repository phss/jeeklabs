class GameScreen < Engine::Screen
  
  def initialize(game_window)
    super(game_window)
  end
  
  def initialize_representations
    pad = Pad.new(PAD_CONFIG)
    ball = Ball.new(BALL_CONFIG, pad, Wall.new)
    
    pad_representation = Engine::QuadRepresentation.new(@game_window, pad, Gosu::white)
    pad_representation.when_key(Gosu::Button::KbLeft) { move_left }
    pad_representation.when_key(Gosu::Button::KbRight) { move_right }
    
    ball_representation = Engine::QuadRepresentation.new(@game_window, ball, Gosu::red)
    ball_representation.always { move }
    return [pad_representation, ball_representation]
  end
  
  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      exit
    end
  end
  
end