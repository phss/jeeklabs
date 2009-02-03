#!/usr/bin/env ruby -wKU
# 
#  ai_pad_controller.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-09-01.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

class AIPadController
  
  def initialize(pad, ball)
    @pad = pad
    @ball = ball
  end
  
  def react
    @pad.move(@ball.y_center - @pad.y_center)
  end
  
  def method_missing(meth, *args, &blk)
    @pad.send(meth, *args, &blk)
  end
  
end