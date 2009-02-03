#!/usr/bin/env ruby -wKU
# 
#  ring.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-09-01.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

RingPoint = Struct.new(:x, :y) do
  def initialize(x, y)
    self.x = x
    self.y = y
  end
  
  def middle_point(point)
    return RingPoint.new(self.x + (point.x - self.x)/2, self.y + (point.y - self.y)/2)
  end
  
end

#
# Tentacle's ring.
#
class Ring
  
  attr_reader :upper_point, :lower_point, :next_ring
  
  def initialize(game_window, upper_point, lower_point, next_ring)
    @game_window = game_window
    @upper_point = upper_point
    @lower_point = lower_point
    @next_ring = next_ring
  end
  
  def grow(units)
    @upper_point.x += units
    upper_lower_distance = @lower_point.y - @upper_point.y
    @upper_point.y += rand*10 - 5 #20 - 10
    
    @lower_point.x = @upper_point.x
    @lower_point.y = @upper_point.y + upper_lower_distance
    @next_ring.grow(units*1.75) if !@next_ring.nil?
  end
    
  def draw(color)
    return if @next_ring.nil?
    
    @game_window.draw_triangle(@upper_point.x, @upper_point.y, color, @lower_point.x, @lower_point.y, color,
                                @next_ring.lower_point.x, @next_ring.lower_point.y, color)
    @game_window.draw_triangle(@upper_point.x, @upper_point.y, color, @next_ring.upper_point.x, @next_ring.upper_point.y, color,
                               @next_ring.lower_point.x, @next_ring.lower_point.y, color)
    
    @next_ring.draw(color)
  end
  
end