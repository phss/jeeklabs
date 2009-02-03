# 
#  binary_nights.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-03-17.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

# Libraries
begin
  # In case you use Gosu via RubyGems.
  require "rubygems"
rescue LoadError
  # In case you don't.
end

require "gosu"

# Constants

WINDOW_WIDTH  = 720
WINDOW_HEIGHT = 440
FONT_SIZE = 18
PAD_HEIGHT = FONT_SIZE*5
PAD_OFFSET = FONT_SIZE*3
TENTACLE_UNIT = (WINDOW_WIDTH/2 - PAD_OFFSET - FONT_SIZE)/5/3

MATCH_SPEC = { 
  :ball => [(WINDOW_WIDTH-FONT_SIZE)/2, (WINDOW_HEIGHT-FONT_SIZE)/2, FONT_SIZE, FONT_SIZE], 
  :left_pad => [PAD_OFFSET, (WINDOW_HEIGHT-PAD_HEIGHT)/2, FONT_SIZE, PAD_HEIGHT],
  :right_pad => [WINDOW_WIDTH-PAD_OFFSET-FONT_SIZE, (WINDOW_HEIGHT-PAD_HEIGHT)/2, FONT_SIZE, PAD_HEIGHT],
  :upper_sideline => [0, 0, WINDOW_WIDTH, 0],
  :bottom_sideline => [0, WINDOW_HEIGHT, WINDOW_WIDTH, 0],
  :left_goal => [0, 0, PAD_OFFSET, WINDOW_HEIGHT],
  :right_goal => [WINDOW_WIDTH-PAD_OFFSET, 0, PAD_OFFSET, WINDOW_HEIGHT]
}

PAD_BYTE = 219 #178
PAD_TEXT = [PAD_BYTE, 10]*5

BALL_BYTE = 64 #233
BALL_TEXT = "@"
SIDELINE_BYTE = 61
SIDELINE_TEXT = "="*36

# Project
$:.unshift(File.dirname(__FILE__))
require "game_engine"
require "text_painter"
require "binary_nights/model/deflector"
require "binary_nights/model/pad"
require "binary_nights/model/ball"
require "binary_nights/model/court"
require "binary_nights/model/match"
require "binary_nights/app/tentacle_representation"
require "binary_nights/app/tentacle"
require "binary_nights/app/ring"
require "binary_nights/app/ai_pad_controller"
require "binary_nights/app/game_flow"