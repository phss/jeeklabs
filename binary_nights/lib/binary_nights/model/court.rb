# 
#  court.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-19.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# Represents a field where a Pong match is played. Has an upper and bottom sideline,
# where the ball deflects, and two goals.
#
class Court
  
  attr_reader :sidelines, :goals
  
  def initialize
    @sidelines = { :upper => Deflector.new(Orientation::horizontal), 
                   :bottom => Deflector.new(Orientation::horizontal) }
    @goals = { :left => GameObject.new, :right => GameObject.new }
    @goal_listeners = []
  end
  
  def add_goal_listener(listener)
     @goal_listeners << listener
  end
  
  def ball_moved(ball)
    @goals.each do |side, goal|
      if ball.collide?(goal)
        @goal_listeners.each { |listener| listener.goal_scored(side) }
        ball.reset
        return
      end
    end
  end

end
