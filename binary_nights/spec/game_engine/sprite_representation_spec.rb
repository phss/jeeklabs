# 
#  object_representation_spec.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-28.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 


require File.dirname(__FILE__) + '/../spec_helper'

describe SpriteRepresentation do
  
  it "should draw sprites based on object's position" do
    object = mock("game object")
    object.should_receive(:x).twice.and_return(20)
    object.should_receive(:y).twice.and_return(30)
    sprite = mock("sprite")
    sprite.should_receive(:draw).twice.with(20, 30)
    sprites = [sprite, sprite]
    
    representation = SpriteRepresentation.new(nil, object, sprites)
    representation.draw
  end
  
end
