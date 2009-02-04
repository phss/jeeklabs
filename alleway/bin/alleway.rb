#!/usr/bin/env ruby -wKU

LIB_DIR = File.expand_path(File.dirname(__FILE__) + "/../lib/")

require LIB_DIR + "/alleway"
require LIB_DIR + "/game_engine"

if __FILE__ == $PROGRAM_NAME
  window = GameWindow.new("Alleway", 512, 480)
  window.show
end