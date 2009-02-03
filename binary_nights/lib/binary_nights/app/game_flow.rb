#!/usr/bin/env ruby -wKU
# 
#  game_flow.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-09-02.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

class GameFlow
  
  def initialize(game_window, match)
    @game_window = game_window
    match.court.add_goal_listener(self)
  end
  
  def goal_scored(side)
    @game_window.change_screen :goal_scored
  end
  
end