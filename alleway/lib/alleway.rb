ALLEWAY_DIR = File.expand_path(File.dirname(__FILE__) + "/alleway")
IMAGES_DIR = File.expand_path(File.dirname(__FILE__) + "/../data/images")
LEVEL_DIR = File.expand_path(File.dirname(__FILE__) + "/../data/level")

require File.expand_path(File.dirname(__FILE__) + "/game_engine")
require ALLEWAY_DIR + "/model/deflector"
require ALLEWAY_DIR + "/model/pad"
require ALLEWAY_DIR + "/model/wall"
require ALLEWAY_DIR + "/model/block"
require ALLEWAY_DIR + "/model/ball"
require ALLEWAY_DIR + "/model/level"
require ALLEWAY_DIR + "/screens/intro_screen"
require ALLEWAY_DIR + "/screens/game_screen"

# Config params
WINDOW_WIDTH = 512
WINDOW_HEIGHT = 480

PAD_CONFIG = { :x => 200, :y => 400, :width => 80, :height => 15}
BALL_CONFIG = { :x => 200, :y => 200, :width => 10, :height => 10}
BLOCK_DIMENSIONS = { :width => 32, :height => 20}
