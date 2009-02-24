require File.dirname(__FILE__) + '/../../spec_helper'

class StubDeflector < Deflector
  
  def initialize(x, y, modifier)
    super()
    @x = x
    @y = y
    @width = 20
    @height = 5
    @modifier = modifier
  end

  def deflection_modifier(ball)
    @modifier
  end
  
end

describe Deflector do
  
  def new_ball_at(x, y)
    return Ball.new({:x => x, :y => y, :width => 5, :height => 5})
  end
  
  it "should not deflect when deflector does not collide with ball" do
    ball = new_ball_at(0, 0)
    deflector = StubDeflector.new(100, 100, 0)
    deflector.deflect_and_adjust(ball)
  end
  
  it "should deflect vertically when hitted from above/below" do
    ball = new_ball_at(105, 98)
    deflector = StubDeflector.new(100, 100, 0)
    previous_velocity = ball.velocity.clone
    
    deflector.deflect_and_adjust(ball)
    
    ball.velocity.x.should == previous_velocity.x
    ball.velocity.y.should == -previous_velocity.y
  end

  it "should deflect horizontally when hitted from left/right" do
    ball = new_ball_at(97, 100)
    deflector = StubDeflector.new(100, 100, 0)
    previous_velocity = ball.velocity.clone
    
    deflector.deflect_and_adjust(ball)
    
    ball.velocity.x.should == -previous_velocity.x
    ball.velocity.y.should == previous_velocity.y
  end

end
