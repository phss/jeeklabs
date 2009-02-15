#!/usr/bin/env ruby -wKU

require "lib/alleway"

if __FILE__ == $PROGRAM_NAME
  window = Engine::GameWindow.new("Alleway", 512, 480)
  window.add_screens_by_class(IntroScreen, GameScreen)
  window.show
end