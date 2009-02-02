#!/usr/bin/env ruby -wKU
# 
#  falling_stuff.rb
#  falling_stuff
#  
#  Created by Paulo Schneider on 2007-12-25.
#  Copyright 2007 Jeek Labs. All rights reserved.
#
 
# Libraries
require "java"
# require "java_lib/slick.jar"
# require "java_lib/lwjgl.jar"

module Java
  include_class "java.awt.Font"
  include_class "java.lang.System"
end

module Slick
  include_package "org.newdawn.slick"
  include_package "org.newdawn.slick.util"  
end

# Constants
BLOCK_SIZE = 20
BOARD_START_X = 20
BOARD_START_Y = 20
NEXT_SHAPE_X = 275
NEXT_SHAPE_Y = 160

# Project
#$:.unshift(File.dirname(__FILE__))
require "falling_stuff/game_window"
require "falling_stuff/board"
require "falling_stuff/shape"