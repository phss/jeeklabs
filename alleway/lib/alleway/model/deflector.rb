class Deflector < Engine::GameObject
  
  def initialize(orientation)
    super()
    @orientation_adjustment = orientation
  end
  
  def deflect_and_adjust(ball)
    return if !collide?(ball)
    
    ball.angle = @orientation_adjustment.call(ball.angle) 
    ball.angle += deflection_modifier(ball)
    
    ball.speed += 0.1
  end
  
  protected
  
  def deflection_modifier(ball)
    0
  end
  
end

#
# Defines the orientation adjustment for a deflector.
#
module Orientation
  
  def Orientation.vertical
    lambda { |angle| Math::PI - angle }
  end
  
  def Orientation.horizontal
    lambda { |angle| -angle }
  end
    
end