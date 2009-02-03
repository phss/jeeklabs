#!/usr/bin/env ruby -wKU
# 
#  game_window.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-08-07.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

class GameWindow < Gosu::Window
  
  attr_reader :representation_builders
  
  def initialize(name, width, height)
    super(width, height, false)
    self.caption = name
    @screens = {}
    @representation_builders = {}
  end
  
  def add_representation_builder(type, builder)
    @representation_builders[type] = builder
  end
  
  def screen(screen_name, &screen_setup)
    @screens[screen_name] = Screen.new(self, &screen_setup)
  end
  
  def start_with(screen_name)
    change_screen(screen_name)
    self.show
  end
  
  def change_screen(screen_name)
    @current_screen = screen_name
  end
  
  def update
    @screens[@current_screen].update
  end

  def draw
    draw_screen @current_screen
  end

  def draw_screen(screen)
    @screens[screen].render
  end
  
  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      exit
    end
  end
  
end