# 
#  game_object.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-26.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# Basic game object, with position and dimensions.
#
class GameObject
  attr_reader :x, :y, :width, :height
  
  def initialize
    @x = 0
    @y = 0
    @width = 0
    @height = 0
  end
  
  def at(x, y)
    @x = x
    @y = y
  end
  
  def dimension(width, height)
    @width = width
    @height = height
  end
  
  # Array format: [x, y, width, height]
  def set_from_array(ary)
    x, y, width, height = ary
    at(x, y)
    dimension(width, height)
  end
  
  def collide?(obj)
    !(obj.x > (@x + @width)  || @x > (obj.x + obj.width) ||
      obj.y > (@y + @height) || @y > (obj.y + obj.height))
  end
  
  def y_center
    @y + (@height/2)
  end
  
end