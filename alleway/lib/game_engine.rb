# Libraries
begin
  # In case you use Gosu via RubyGems.
  require "rubygems"
rescue LoadError
  # In case you don't.
end

require "gosu"

ENGINE_DIR = File.expand_path(File.dirname(__FILE__) + "/game_engine")

require ENGINE_DIR + "/game_window"
require ENGINE_DIR + "/screen"
require ENGINE_DIR + "/intersection"
require ENGINE_DIR + "/game_object"
require ENGINE_DIR + "/object_representation"
require ENGINE_DIR + "/representations/quad_representation"
require ENGINE_DIR + "/representations/image_representation"