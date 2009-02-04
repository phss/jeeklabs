# Libraries
begin
  # In case you use Gosu via RubyGems.
  require "rubygems"
rescue LoadError
  # In case you don't.
end

require "gosu"


ENGINE_DIR = File.expand_path(File.dirname(__FILE__) + "/game_engine")
IMAGES_DIR = File.expand_path(File.dirname(__FILE__) + "/../data/images")

require ENGINE_DIR + "/game_window"