# 
#  deflector_spec.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-26.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

require File.dirname(__FILE__) + '/../../spec_helper'

class StubDeflector < Deflector
  
  def initialize(x, y, orientation, modifier)
    super(orientation)
    @x = x
    @y = y
    @width = 5
    @height = 20
    @modifier = modifier
  end

  def deflection_modifier(ball)
    @modifier
  end
  
end

describe Deflector do
  
  def mock_ball(x, y)
    ball = mock("ball")
    ball.should_receive(:x).at_least(:once).and_return(x)
    ball.should_receive(:y).any_number_of_times.and_return(y)
    ball.should_receive(:width).any_number_of_times.and_return(5)
    ball.should_receive(:height).any_number_of_times.and_return(5)
    return ball
  end
  
  it "should not deflect when deflector does not collide with ball" do
    ball = mock_ball(0, 0)
    deflector = StubDeflector.new(100, 100, Orientation::horizontal, 0)
    deflector.deflect_and_adjust(ball)
  end
  
  it "horizontal deflector should deflect in a mirror angle when colliding with ball" do
    ball = mock_ball(100, 50)
    ball.should_receive(:angle).and_return(10, 10);
    ball.should_receive(:angle=).with(10);
    ball.should_receive(:angle=).with(-10);
    deflector = StubDeflector.new(100, 50, Orientation::horizontal, 0)
    deflector.deflect_and_adjust(ball)
  end

  it "vertical deflector should deflect in a mirror angle when colliding with ball" do
    ball = mock_ball(100, 50)
    ball.should_receive(:angle).and_return(10, Math::PI - 10);
    ball.should_receive(:angle=).with(Math::PI - 10).twice;
    deflector = StubDeflector.new(100, 50, Orientation.vertical, 0)
    deflector.deflect_and_adjust(ball)
  end

  
  it "should deflect in a mirror angle with a deflection modifier" do
    ball = mock_ball(100, 50)
    ball.should_receive(:angle).and_return(10, -10);
    ball.should_receive(:angle=).with(-10);
    ball.should_receive(:angle=).with(-9.5);
    deflector = StubDeflector.new(100, 50, Orientation::horizontal, 0.5)
    deflector.deflect_and_adjust(ball)
  end
  
end
