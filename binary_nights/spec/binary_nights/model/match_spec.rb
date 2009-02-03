# 
#  match_spec.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-27.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

require File.dirname(__FILE__) + '/../../spec_helper'

describe Match do
  
  it "should successfully create, with position and dimensions, a match through a spec" do
    spec = { 
      :ball => [320, 240, 5, 5], 
      :left_pad => [20, 300, 5, 20],
      :right_pad => [615, 300, 5, 20],
      :upper_sideline => [0, 0, 640, 5],
      :bottom_sideline => [0, 475, 640, 5],
      :left_goal => [0, 0, 20, 480],
      :right_goal => [620, 0, 20, 480]
    }
    match = Match.from_spec(spec)
    assert_position_and_dimension(match.ball, spec[:ball])
    assert_position_and_dimension(match.left_pad, spec[:left_pad])
    assert_position_and_dimension(match.right_pad, spec[:right_pad])
    assert_position_and_dimension(match.court.sidelines[:upper], spec[:upper_sideline])
    assert_position_and_dimension(match.court.sidelines[:bottom], spec[:bottom_sideline])
    assert_position_and_dimension(match.court.goals[:left], spec[:left_goal])
    assert_position_and_dimension(match.court.goals[:right], spec[:right_goal])
  end
  
  def assert_position_and_dimension(element, expected)
    x, y, width, height = expected
    element.x.should == x
    element.y.should == y
    element.width.should == width
    element.height.should == height
  end
  
end
