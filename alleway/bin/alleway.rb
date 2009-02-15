#!/usr/bin/env ruby -wKU

require "lib/alleway"

if __FILE__ == $PROGRAM_NAME
  window = Engine::GameWindow.new("Alleway", 512, 480)
  window.add_screen(IntroScreen)
  window.show
end