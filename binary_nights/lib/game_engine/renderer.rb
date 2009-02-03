# 
#  renderer.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-28.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# Renders all object representations.
#
class Renderer
  
  def initialize
    @representations = []
  end

  def add_representation(representation)
    @representations << representation
  end
  
  def draw_all
    @representations.each do |representation|
      representation.draw
    end
  end
  
end