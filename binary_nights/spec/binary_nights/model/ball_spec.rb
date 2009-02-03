# 
#  ball_spec.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-03-19.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

require File.dirname(__FILE__) + '/../../spec_helper'

describe Ball do
  
  before(:each) do
    @ball = Ball.new
    @ball.at(320, 240)
  end
  
  describe "(moving)" do
    it "should follow a straight orthogonal path when not colliding" do
      assert_movement(0, @ball.x + @ball.speed, @ball.y)            # 0 degrees
      assert_movement(Math::PI/2, @ball.x, @ball.y + @ball.speed)   # 90 degrees
      assert_movement(Math::PI, @ball.x - @ball.speed, @ball.y)     # 180 degrees
      assert_movement(3*Math::PI/2, @ball.x, @ball.y - @ball.speed) # 270 degrees
      assert_movement(2*Math::PI, @ball.x + @ball.speed, @ball.y)   # 360 degrees
    end
    
    it "should follow a straight diagonal path when not colliding" do
      assert_movement(0.643502895, @ball.x + 4, @ball.y + 3) # Right triangle
      # TODO more testing?
    end
    
    def assert_movement(angle, expected_x, expected_y)
      @ball.angle = angle
      @ball.move
      @ball.x.should > expected_x - 0.00001
      @ball.x.should < expected_x + 0.00001
      @ball.y.should > expected_y - 0.00001
      @ball.y.should < expected_y + 0.00001
    end
  end
  
  describe "(deflecting)" do
    
    it "should deflect when colliding with deflector" do
      deflector = mock("deflector")
      @ball = Ball.new(deflector, deflector)
      deflector.should_receive(:deflect_and_adjust).twice.with(@ball)
      @ball.move
    end
    
  end
  
end