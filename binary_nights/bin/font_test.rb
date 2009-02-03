# 
#  font_test.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-04-21.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 
#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'gosu'

class FontTest < Gosu::Window
  
  def initialize
    super(640, 480, false)
    @size = 18
    @timg = Gosu::Image.load_tiles(self, "data/fonts/font.png", @size, @size, false)
  end

  def draw
    print_str "===@=====Blaaa!xxxx"
  end
  
  def print_str(str)
    pos = 20
    str.each_byte do |byte|
      @timg[byte].draw(pos, 20, 0)
      pos += @size
    end
    pos = 100
    byte = 178
    5.times do
      @timg[byte].draw(50, pos, 0)
      pos += @size
    end
  end
  
end

if __FILE__ == $PROGRAM_NAME
  test = FontTest.new
  test.show
end