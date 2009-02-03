# 
#  sprite_spec.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-28.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 


require File.dirname(__FILE__) + '/../spec_helper'

describe Sprite do
  
  it "should draw based on the offset values" do
    image = mock("image")
    image.should_receive(:draw).with(15, 25, 0, 1, 1, 0xffffffff)
        
    sprite = Sprite.new(image, 10, 20, 0xffffffff)
    sprite.draw(5, 5)
  end
  
end
