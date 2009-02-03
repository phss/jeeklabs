# 
#  sprite.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-28.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# Sprite image. TODO better comments?
#
class Sprite
  
  attr_writer :color
  
  def initialize(image, offset_x, offset_y, color)
    @image = image
    @offset_x = offset_x
    @offset_y = offset_y
    @color = color
  end
  
  def draw(x, y)
    @image.draw(x + @offset_x, y + @offset_y, 0, 1, 1, @color)
  end
  
end