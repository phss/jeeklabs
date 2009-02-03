# 
#  renderer_spec.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-28.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 


require File.dirname(__FILE__) + '/../spec_helper'

describe Renderer do
  it "should draw all representations" do
    mock_rep = mock("representation")
    mock_rep.should_receive(:draw).twice    
    
    renderer = Renderer.new
    renderer.add_representation(mock_rep)
    renderer.add_representation(mock_rep)
    renderer.draw_all
  end
end
