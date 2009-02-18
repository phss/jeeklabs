ALLEWAY_DIR = File.expand_path(File.dirname(__FILE__) + "/alleway")

require File.expand_path(File.dirname(__FILE__) + "/game_engine")
require ALLEWAY_DIR + "/model/pad"
require ALLEWAY_DIR + "/screens/intro_screen"
require ALLEWAY_DIR + "/screens/game_screen"

# Config params
WINDOW_WIDTH = 512
WINDOW_HEIGHT = 480

PAD_CONFIG = { :x => 200, :y => 400, :width => 100, :height => 20}
