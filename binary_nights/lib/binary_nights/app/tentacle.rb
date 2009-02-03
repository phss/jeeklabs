#!/usr/bin/env ruby -wKU
# 
#  tentacle.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-08-22.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

class Tentacle
  
  def initialize(game_window, upper_base, lower_base, tip)
    @game_window = game_window
    generate_rings(upper_base, lower_base, tip)
    reset
  end
  
  def move(units)
    @base_ring.next_ring.grow(units)
  end
  
  def reset
    generate_rings(@base_ring.upper_point, @base_ring.lower_point, @base_ring.upper_point.middle_point(@base_ring.lower_point))
    100.times { move(0) }
  end
    
  def draw(middle)
    color = @tip.upper_point.x < middle ? Gosu::black : Gosu::white
    @base_ring.draw(color)
  end
  
  private
  
  def generate_rings(upper_base, lower_base, tip)
    @tip = Ring.new(@game_window, tip, tip, nil)
    upper_base_tip_diff = tip.y - upper_base.y
    lower_base_tip_diff = lower_base.y - tip.y
    third_ring = Ring.new(@game_window, RingPoint.new(upper_base.x, upper_base.y + upper_base_tip_diff*3/4), 
                                        RingPoint.new(lower_base.x, tip.y + lower_base_tip_diff*1/4), @tip)
    second_ring = Ring.new(@game_window, RingPoint.new(upper_base.x, upper_base.y + upper_base_tip_diff/2), 
                                         RingPoint.new(lower_base.x, tip.y + lower_base_tip_diff/2), third_ring)
    @base_ring = Ring.new(@game_window, upper_base, lower_base, second_ring)
  end
  
end