# 
#  ball.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-03-19.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# Represents the ball of a Pong game. A ball can collide and be deflected by
# the court's sidelines and the player's pads. When a ball reach a goal zone, 
# the oposing player scores.
#
class Ball < GameObject
  
  attr_accessor :angle, :speed

  def initialize(*deflectors)
    super()
    @deflectors = deflectors
    @movement_listeners = []
    reset
  end
  
  def reset
    @angle = Math::PI/4
    @speed = 5
    @x = (WINDOW_WIDTH-FONT_SIZE)/2
    @y = (WINDOW_HEIGHT-FONT_SIZE)/2
  end
  
  def add_movement_listener(listener)
    @movement_listeners << listener
  end
  
  def move
    @deflectors.each { |deflector| deflector.deflect_and_adjust(self) }
    @x += speed*Math.cos(angle)
    @y += speed*Math.sin(angle)
    @movement_listeners.each { |listener| listener.ball_moved(self) }
  end

end
