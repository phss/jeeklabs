#!/usr/bin/env ruby -wKU

require "lib/binary_nights"

game = GameWindow.new("Binary Nights", WINDOW_WIDTH, WINDOW_HEIGHT)

game.screen :game do
  custom_representation(FractalRepresentation.new(game)).with_input_control do
     when_key(Gosu::Button::KbLeft) { goal_scored :left }
     when_key(Gosu::Button::KbRight) { goal_scored :right }
  end
end
  
game.start_with :game
