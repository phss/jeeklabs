#!/usr/bin/env ruby -wKU
# 
#  shape.rb
#  falling_stuff
#  
#  Created by Paulo Schneider on 2007-12-25.
#  Copyright 2007 Jeek Labs. All rights reserved.
# 

# TODO add comments

#
#
#
class Block < Struct.new(:x, :y, :color)
  def position(x, y)
    self.x = x
    self.y = y
  end
end
  
#
#
#
class Shape
  
  attr_reader :blocks
  
  def initialize(game_window, initial_x, initial_y)
    @game_window = game_window    
    
    @rotations = Array.new
    initialize_rotations
    
    @current_state = 0 
    @blocks = Array.new(4) { Block.new(0, 0, color) }
    position(initial_x, initial_y)
  end
  
  def position(x, y)
    @blocks.each { |block| block.position(x, y)  }
    rotate_to_state(@current_state)
  end
  
  def move_left
    @blocks.each { |block| block.x = block.x - 1 }
  end
  
  def move_right
    @blocks.each { |block| block.x = block.x + 1 }
  end
  
  def move_up
    @blocks.each { |block| block.y = block.y - 1 }
  end
  
  def move_down
    @blocks.each { |block| block.y = block.y + 1 }
  end
  
  def rotate_counter_clockwise
    if @current_state == 0
      @current_state = @rotations.size - 1
    else
      @current_state = @current_state - 1
    end
    rotate_to_state(@current_state)
  end
  
  def rotate_clockwise
    if @current_state == @rotations.size - 1
      @current_state = 0
    else
      @current_state = @current_state + 1
    end
    rotate_to_state(@current_state)
  end
  
  def draw(offset_x, offset_y)
    # TODO change block drawing to be less magical
    block_image = @game_window.resources[color]
    @blocks.each { |block| block_image.draw(offset_x + BLOCK_SIZE*block.x, 
                                            offset_y + BLOCK_SIZE*block.y) }
  end
  
  def color
    raise "Subclass must implement method"    
  end
  
  protected
  
  def add_rotation(&rotation_block)
    @rotations << rotation_block
  end
  
  def rotate_to_state(state)
    anchor = @blocks[anchor_block]
    @rotations[state].call(@blocks, anchor)
  end
  
  def anchor_block
    0 # Default value
  end
  
  def initialize_rotations
    raise "Subclass must implement method"
  end
  
end

#
#
#
class IShape < Shape
  
  def color
    "blue"
  end
  
  protected 
  
  def anchor_block
    1
  end

  def initialize_rotations
    add_rotation do |blocks, anchor|
      blocks[0].position(anchor.x-1, anchor.y)
      blocks[2].position(anchor.x+1, anchor.y)
      blocks[3].position(anchor.x+2, anchor.y)
    end
    add_rotation do |blocks, anchor|
      blocks[0].position(anchor.x, anchor.y+1)
      blocks[2].position(anchor.x, anchor.y-1)
      blocks[3].position(anchor.x, anchor.y-2)
    end
  end
end

#
#
#
class OShape < Shape
  
  def color
    "yellow"
  end

  protected 
  
  def initialize_rotations
    add_rotation do |blocks, anchor|
      blocks[1].position(anchor.x+1, anchor.y)
      blocks[2].position(anchor.x, anchor.y+1)
      blocks[3].position(anchor.x+1, anchor.y+1)
    end
  end
end

#
#
#
class SShape < Shape
  
  def color
    "pink"
  end
  
  protected
  
  def initialize_rotations
    add_rotation do |blocks, anchor|
      blocks[1].position(anchor.x+1, anchor.y)
      blocks[2].position(anchor.x, anchor.y+1)
      blocks[3].position(anchor.x-1, anchor.y+1)
    end
    add_rotation do |blocks, anchor|
      blocks[1].position(anchor.x, anchor.y-1)
      blocks[2].position(anchor.x+1, anchor.y)
      blocks[3].position(anchor.x+1, anchor.y+1)
    end
  end
end

#
#
#
class ZShape < Shape

  def color
    "dgreen"
  end
  
  protected
  
  def anchor_block
    1
  end
  
  def initialize_rotations
    add_rotation do |blocks, anchor|
      blocks[0].position(anchor.x-1, anchor.y)
      blocks[2].position(anchor.x, anchor.y+1)
      blocks[3].position(anchor.x+1, anchor.y+1)
    end
    add_rotation do |blocks, anchor|    
      blocks[0].position(anchor.x, anchor.y+1)
      blocks[2].position(anchor.x+1, anchor.y)
      blocks[3].position(anchor.x+1, anchor.y-1)
    end
  end
end

#
#
#
class LShape < Shape
  
  def color
    "red"
  end
  
  protected
  
  def anchor_block
    1
  end
  
  def initialize_rotations
    add_rotation do |blocks, anchor|
      blocks[0].position(anchor.x-1, anchor.y)
      blocks[2].position(anchor.x+1, anchor.y)
      blocks[3].position(anchor.x-1, anchor.y+1)
    end
    add_rotation do |blocks, anchor|    
      blocks[0].position(anchor.x, anchor.y-1)
      blocks[2].position(anchor.x, anchor.y+1)
      blocks[3].position(anchor.x-1, anchor.y-1)
    end
    add_rotation do |blocks, anchor|
      blocks[0].position(anchor.x-1, anchor.y)
      blocks[2].position(anchor.x+1, anchor.y)
      blocks[3].position(anchor.x+1, anchor.y-1)
    end
    add_rotation do |blocks, anchor|   
      blocks[0].position(anchor.x, anchor.y-1)
      blocks[2].position(anchor.x, anchor.y+1)
      blocks[3].position(anchor.x+1, anchor.y+1)
    end
  end
end

#
#
#
class JShape < Shape
  
  def color
    "gray"
  end
  
  protected
  
  def anchor_block
    1
  end
  
  def initialize_rotations
    add_rotation do |blocks, anchor|
      blocks[0].position(anchor.x-1, anchor.y)
      blocks[2].position(anchor.x+1, anchor.y)
      blocks[3].position(anchor.x+1, anchor.y+1)
    end
    add_rotation do |blocks, anchor| 
      blocks[0].position(anchor.x, anchor.y-1)
      blocks[2].position(anchor.x, anchor.y+1)
      blocks[3].position(anchor.x-1, anchor.y+1)
    end
    add_rotation do |blocks, anchor|
      blocks[0].position(anchor.x-1, anchor.y)
      blocks[2].position(anchor.x+1, anchor.y)
      blocks[3].position(anchor.x-1, anchor.y-1)
    end
    add_rotation do |blocks, anchor|    
      blocks[0].position(anchor.x, anchor.y-1)
      blocks[2].position(anchor.x, anchor.y+1)
      blocks[3].position(anchor.x+1, anchor.y-1)
    end
  end
end

#
#
#
class TShape < Shape
  
  def color
    "green"
  end
  
  protected
  
  def anchor_block
    1
  end
  
  def initialize_rotations
    add_rotation do |blocks, anchor|
      blocks[0].position(anchor.x-1, anchor.y)
      blocks[2].position(anchor.x+1, anchor.y)
      blocks[3].position(anchor.x, anchor.y+1)
    end
    add_rotation do |blocks, anchor|    
      blocks[0].position(anchor.x, anchor.y-1)
      blocks[2].position(anchor.x, anchor.y+1)
      blocks[3].position(anchor.x-1, anchor.y)
    end
    add_rotation do |blocks, anchor|
      blocks[0].position(anchor.x-1, anchor.y)
      blocks[2].position(anchor.x+1, anchor.y)
      blocks[3].position(anchor.x, anchor.y-1)
    end
    add_rotation do |blocks, anchor|   
      blocks[0].position(anchor.x, anchor.y-1)
      blocks[2].position(anchor.x, anchor.y+1)
      blocks[3].position(anchor.x+1, anchor.y)
    end
  end
end





