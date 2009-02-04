#!/usr/bin/env ruby -wKU

require "lib/game_engine"

if __FILE__ == $PROGRAM_NAME
  window = GameWindow.new("Alleway", 512, 480)
  window.show
end