# 
#  match.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-27.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# A Pong match
#
class Match
  
  attr_reader :court, :left_pad, :right_pad, :ball
  
  def initialize
    @court = Court.new
    @left_pad  = Pad.new(@court)
    @right_pad = Pad.new(@court)
    @ball = Ball.new(@left_pad, @right_pad, @court.sidelines[:upper], @court.sidelines[:bottom])
    @ball.add_movement_listener(@court)
  end
  
  def Match.from_spec(spec)
    match = Match.new
    match.ball.set_from_array(spec[:ball])
    match.left_pad.set_from_array(spec[:left_pad])
    match.right_pad.set_from_array(spec[:right_pad])
    match.court.sidelines[:upper].set_from_array(spec[:upper_sideline])
    match.court.sidelines[:bottom].set_from_array(spec[:bottom_sideline])
    match.court.goals[:left].set_from_array(spec[:left_goal])
    match.court.goals[:right].set_from_array(spec[:right_goal])
    return match
  end
  
end