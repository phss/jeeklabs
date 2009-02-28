class GameScreen < Engine::Screen
  
  def initialize(game_window)
    super(game_window)
  end
  
  def initialize_representations
    level = Level.new
    representations = []
    
    pad = Engine::QuadRepresentation.new(@game_window, level.pad, Gosu::white)
    pad.when_key(Gosu::Button::KbLeft) { move_left }
    pad.when_key(Gosu::Button::KbRight) { move_right }
    representations << pad
    
    ball = Engine::QuadRepresentation.new(@game_window, level.ball, Gosu::red)
    ball.always { move }
    representations << ball
    
    level.blocks.each do |block|
      block.when_deflect do
        level.ball.remove_deflector(block)
        remove_representation_for(block)
      end
      representations << Engine::QuadRepresentation.new(@game_window, block, Gosu::gray)
    end
    
    return representations.flatten
  end
  
  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      exit
    end
  end
  
end