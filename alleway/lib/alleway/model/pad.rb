class Pad
  
  attr_reader :x, :y
  
  def initialize
    @x = 100
    @y = 20
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