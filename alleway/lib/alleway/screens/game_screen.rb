class GameScreen < Engine::Screen
  
  def initialize(game_window)
    super(game_window)
  end
  
  def initialize_representations
    pad = Engine::QuadRepresentation.new(@game_window, Pad.new(PAD_CONFIG), Gosu::white)
    pad.when_key(Gosu::Button::KbLeft) { move_left }
    pad.when_key(Gosu::Button::KbRight) { move_right }
    
    ball = Engine::QuadRepresentation.new(@game_window, Ball.new(BALL_CONFIG), Gosu::red)
    return [pad, ball]
  end
  
  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      exit
    end
  end
  
end