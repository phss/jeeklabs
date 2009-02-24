class GameScreen < Engine::Screen
  
  def initialize(game_window)
    super(game_window)
  end
  
  def initialize_representations
    pad_obj = Pad.new(PAD_CONFIG)
    pad = Engine::QuadRepresentation.new(@game_window, pad_obj, Gosu::white)
    pad.when_key(Gosu::Button::KbLeft) { move_left }
    pad.when_key(Gosu::Button::KbRight) { move_right }
    
    ball = Engine::QuadRepresentation.new(@game_window, Ball.new(BALL_CONFIG, pad_obj), Gosu::red)
    ball.always { move }
    return [pad, ball]
  end
  
  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      exit
    end
  end
  
end