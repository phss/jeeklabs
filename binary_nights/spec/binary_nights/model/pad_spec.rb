# 
#  pad_spec.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-03-17.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

require File.dirname(__FILE__) + '/../../spec_helper'

describe Pad do

  def create_mock_court
    upper_sideline = Deflector.new(Orientation::horizontal)
    upper_sideline.at(0, 0)
    upper_sideline.dimension(100, 10)
    bottom_sideline = Deflector.new(Orientation::horizontal)
    bottom_sideline.at(0, 100)
    bottom_sideline.dimension(100, 10)
    sidelines = { :upper => upper_sideline, :bottom => bottom_sideline }
    
    court = mock("court")
    court.should_receive(:sidelines).any_number_of_times.and_return(sidelines)
    return court
  end
  
  before(:each) do
    @pad = Pad.new(create_mock_court)
    @pad.at(0, 50)
    @pad.dimension(10, 20)
  end
    
  describe "(moving)" do
    
    it "should be able to move up" do
      prev_y = @pad.y
      @pad.move_up
      @pad.y.should < prev_y
    end
    
    it "should be able to move down" do
      prev_y = @pad.y
      @pad.move_down
      @pad.y.should > prev_y
    end

    it "should not be able to move past the upper sideline" do
      @pad.at(0, 11)
      @pad.move_up
      @pad.y.should == 10
    end    
    
    it "should not be able to move past the bottom sideline" do
      @pad.at(0, 79)
      @pad.move_down
      @pad.y.should == 80
    end
    
  end
  
  describe "(deflecting ball)" do
    
    it "should deflect ball on a mirror degree angle when hit in the middle" do
      ball = Ball.new
      ball.dimension(4, 4)
      ball.at(0, 58)
      angle = ball.angle
      @pad.deflect_and_adjust(ball)
      ball.angle.should == Math::PI - angle
    end
    
    it "should deflect ball on upward mirror degree when hit in the top" do
      pending
    end
    
    it "should deflect ball on downward mirror degree when hit in the bottom" do
      pending
    end
    
  end
  
end