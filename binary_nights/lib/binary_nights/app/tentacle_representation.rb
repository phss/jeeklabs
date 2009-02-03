#!/usr/bin/env ruby -wKU
# 
#  tentacle_representation.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-08-07.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

class TentacleRepresentation < ObjectRepresentation
  
  def initialize(game_window, tentacles, court)
    super(game_window, self)
    @game_window = game_window
    @score = 0
    @tentacles = tentacles
    court.add_goal_listener(self)
  end
  
  def goal_scored(side)
    @growth_direction = side == :left ? -1 : 1
    @score += @growth_direction
    @remaining_growth = TENTACLE_UNIT
  end
  
  def grow
    growth_unit = 0.2
    @tentacles.each { |tentacle| tentacle.move(growth_unit*@growth_direction) }
    @remaining_growth -= growth_unit
    
    if @remaining_growth < 0
      @tentacles.each { |tentacle| tentacle.reset } if @score == 0
      @game_window.change_screen :game
    end
  end

  def draw
    middle = @game_window.width/2
    @game_window.draw_quad(0, 0, Gosu::white, middle, 0, Gosu::white, 0, 480, Gosu::white, middle, 480, Gosu::white)
    @tentacles.each { |tentacle| tentacle.draw(middle) }
  end

end