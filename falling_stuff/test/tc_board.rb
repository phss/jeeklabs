#!/usr/bin/env ruby -wKU
# 
#  tc_board.rb
#  falling_stuff
#  
#  Created by Paulo Schneider on 2007-12-29.
#  Copyright 2007 Jeek Labs. All rights reserved.
# 
require "test/unit"

require "falling_stuff"

class TestBoard < Test::Unit::TestCase
  
  def setup
   @board = Board.new(nil)
  end
  
  def test_settling_shape_in_a_empty_board
    shape = OShape.new(nil, 0, 0)
    assert(!@board.collides?(shape))
    @board.settle_shape(shape)
    assert(@board.collides?(shape))
  end
  
  def test_settling_shape_in_already_settled_space
    shape = OShape.new(nil, 0, 0)
    @board.settle_shape(shape)
    assert_raise(RuntimeError) { @board.settle_shape(shape) }
  end
  
  def test_empty_board_collides?
    0.upto((@board.width-1)/2) do |x|
      0.upto((@board.height-1)/2) do |y|
        assert(!@board.collides?(OShape.new(nil, x*2, y*2)))
      end
    end
  end
  
  def test_out_of_bounds_collide?
    assert(@board.collides?(OShape.new(nil, -1, 0)))
    assert(@board.collides?(OShape.new(nil, 0, -1)))
    assert(@board.collides?(OShape.new(nil, @board.width, 0)))
    assert(@board.collides?(OShape.new(nil, 0, @board.height)))
  end
  
  def test_collide_with_existing_shape
    @board.settle_shape(IShape.new(nil, 1, 0))
    assert(@board.collides?(OShape.new(nil, 1, 0)))
  end
  
end