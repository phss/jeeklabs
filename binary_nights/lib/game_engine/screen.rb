#!/usr/bin/env ruby -wKU
# 
#  screen.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-08-07.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

class Screen
  
  def initialize(game_window, &screen_setup)
    @game_window = game_window
    @screens_to_draw = []
    @representations = []    
    instance_eval(&screen_setup)
  end
  
  def build_representation(type, *args)
    with_representation(@game_window.representation_builders[type].build_representation_for(*args))
  end
  
  def with_representation(representation)
    @representations << representation
    return representation
  end
  
  def render_screen(screen)
    @screens_to_draw << screen
  end
  
  def render
    @representations.each { |representation| representation.draw }
    @screens_to_draw.each { |screen| @game_window.draw_screen(screen) }
  end
  
  def update
    @representations.each { |representation| representation.update }
  end
  
  # Redirects to the right builder from the game_window:
  # Ex: something_representation_for method will call build_representation_for on builder :something
  def method_missing(method, *args, &blk)
    if match = method.to_s.match(/^(\w+)_representation_for$/)
      build_representation(match[1].to_sym, *args)
    else
      super
    end
  end
  
end