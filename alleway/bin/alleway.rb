#!/usr/bin/env ruby -wKU

require "lib/alleway"

if __FILE__ == $PROGRAM_NAME
  window = Engine::GameWindow.new("Alleway", WINDOW_WIDTH, WINDOW_HEIGHT)
  window.add_screens_by_class(IntroScreen, GameScreen)
  window.show
end