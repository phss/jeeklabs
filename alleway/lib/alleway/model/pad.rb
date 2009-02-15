class Pad
  
  attr_reader :x, :y
  
  def initialize
    @x = 200
    @y = 400
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