# 
#  deflector.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-26.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# Deflects balls based on a deflection modifier.
#
class Deflector < GameObject
  
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