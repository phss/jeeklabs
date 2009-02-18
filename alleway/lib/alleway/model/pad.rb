class Pad < Engine::GameObject
  
  def initialize(config)
    configure_with(config)
  end
  
  def move_left
    @x -= 5
  end
  
  def move_right
    @x += 5
  end
  
  def draw
    
  end
  
end