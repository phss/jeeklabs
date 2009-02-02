#!/usr/bin/env ruby -wKU
# 
#  fs.rb
#  falling_stuff
#  
#  Created by Paulo Schneider on 2007-12-25.
#  Copyright 2007 Jeek Labs. All rights reserved.
# 
$CLASSPATH << File.expand_path(File.dirname(__FILE__) + "/../java/lib/slick.jar")
$CLASSPATH << File.expand_path(File.dirname(__FILE__) + "/../java/lib/lwjgl.jar")
$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../lib")

require "falling_stuff"

container = Slick::AppGameContainer.new(GameWindow.new)
container.set_display_mode(340, 440, false)
container.set_target_frame_rate(30)
container.set_minimum_logic_update_interval(30)
container.set_show_fps(false)
container.set_verbose(false)
#container.set_icon("resources/icons/Icone01.ico")
container.start
