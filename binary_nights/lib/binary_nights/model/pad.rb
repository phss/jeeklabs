# 
#  pad.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-03-17.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# Player controlled pad that deflects balls.
#
class Pad < Deflector
  
  attr_reader :speed
  
  def initialize(court)
    super(Orientation::vertical)
    @court = court
    @speed = 4
  end
  
  def move_up
    move(-@speed)
  end
  
  def move_down
    move(@speed)
  end
  
  def move(units)
    y_movement = units.abs > @speed ? @speed*(units/units.abs) : units # Hacky
    @y += y_movement.round
    
    sideline = @court.sidelines[:upper]
    @y = sideline.y + sideline.height if sideline.collide?(self)
    
    sideline = @court.sidelines[:bottom]
    @y = sideline.y - @height if sideline.collide?(self)    
  end
  
  protected
  
  def deflection_modifier(ball)
    modifier = (ball.y_center - self.y_center)/150
    modifier = -modifier if ball.x < @x
    return modifier
  end
  
end