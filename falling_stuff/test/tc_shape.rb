#!/usr/bin/env ruby -wKU
# 
#  tc_shape.rb
#  falling_stuff
#  
#  Created by Paulo Schneider on 2007-12-29.
#  Copyright 2007 Jeek Labs. All rights reserved.
# 
require "test/unit"

require "falling_stuff"

class TestShape < Test::Unit::TestCase
  
  def test_moving_the_shape
    expected = [[0, 0], [1, 0], [0, 1], [1, 1]]
    shape = OShape.new(nil, 0, 0)
    assert_blocks_position(expected, shape.blocks)
    
    expected.each { |position|  position[0] = position[0]-1 }
    shape.move_left
    assert_blocks_position(expected, shape.blocks)
    
    expected.each { |position|  position[0] = position[0]+1 }
    shape.move_right
    assert_blocks_position(expected, shape.blocks)
    
    expected.each { |position|  position[1] = position[1]-1 }
    shape.move_up
    assert_blocks_position(expected, shape.blocks)
    
    expected.each { |position|  position[1] = position[1]+1 }
    shape.move_down
    assert_blocks_position(expected, shape.blocks)
  end
  
  def test_rotation_I_Shape
    rotations = [[[-1, 0], [0, 0], [1, 0],  [2, 0]],
                 [[0, 1],  [0, 0], [0, -1], [0, -2]]]
    assert_rotations(rotations, IShape.new(nil, 0, 0))
  end
  
  def test_rotation_O_Shape
    rotations = [[[0, 0], [1, 0], [0, 1], [1, 1]]]
    assert_rotations(rotations, OShape.new(nil, 0, 0))
  end  
  
  def test_rotation_S_Shape
    rotations = [[[0, 0], [1, 0],  [0, 1], [-1, 1]],
                 [[0, 0], [0, -1], [1, 0], [1, 1]]]
    assert_rotations(rotations, SShape.new(nil, 0, 0))
  end  
  
  def test_rotation_Z_Shape
    rotations = [[[-1, 0], [0, 0], [0, 1], [1, 1]],
                 [[0, 1],  [0, 0], [1, 0], [1, -1]]]
    assert_rotations(rotations, ZShape.new(nil, 0, 0))
  end
  
  def test_rotation_L_Shape
    rotations = [[[-1, 0], [0, 0], [1, 0], [-1, 1]],
                 [[0, -1], [0, 0], [0, 1], [-1, -1]],
                 [[-1, 0], [0, 0], [1, 0], [1, -1]],
                 [[0, -1], [0, 0], [0, 1], [1, 1]]]
    assert_rotations(rotations, LShape.new(nil, 0, 0))
  end
  
  def test_rotation_J_Shape
    rotations = [[[-1, 0], [0, 0], [1, 0], [1, 1]],
                 [[0, -1], [0, 0], [0, 1], [-1, 1]],
                 [[-1, 0], [0, 0], [1, 0], [-1, -1]],
                 [[0, -1], [0, 0], [0, 1], [1, -1]]]
    assert_rotations(rotations, JShape.new(nil, 0, 0))
  end
  
  def test_rotation_T_Shape
    rotations = [[[-1, 0], [0, 0], [1, 0], [0, 1]],
                 [[0, -1], [0, 0], [0, 1], [-1, 0]],
                 [[-1, 0], [0, 0], [1, 0], [0, -1]],
                 [[0, -1], [0, 0], [0, 1], [1, 0]]]
    assert_rotations(rotations, TShape.new(nil, 0, 0))
  end  
  
  def assert_rotations(rotations, shape)
    rotations.each do |rotation|
      assert_blocks_position(rotation, shape.blocks)
      shape.rotate_clockwise
    end
    rotations.reverse.each do |rotation|
      shape.rotate_counter_clockwise
      assert_blocks_position(rotation, shape.blocks)
    end
  end
  
  def assert_blocks_position(expected_positions, blocks)
    expected_positions.each_with_index do |position, i|
      assert_equal(position[0], blocks[i].x, "X value does not match for block #{i}.")
      assert_equal(position[1], blocks[i].y, "Y value does not match for block #{i}.")
    end
  end
  
end