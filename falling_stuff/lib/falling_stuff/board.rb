#!/usr/bin/env ruby -wKU
# 
#  board.rb
#  falling_stuff
#  
#  Created by Paulo Schneider on 2007-12-25.
#  Copyright 2007 Jeek Labs. All rights reserved.
# 

# TODO add and improve comments

#
# 
#
class Board
  
  attr_reader :width, :height
  
  def initialize(game_window)
    @game_window = game_window
    @width  = 10
    @height = 20
    @settled_blocks = Array.new(@width) { Array.new(@height) { nil } }
  end
  
  # Checks if the active shape collides with the settled shapes.
  def collides?(shape)
    shape.blocks.each do |block|  
      return true if block.x >= @width || block.x < 0 || block.y >= @height || block.y < 0
      return true if !@settled_blocks[block.x][block.y].nil? 
    end
    return false
  end
  
  # Add the shape's blocks to the list of settled blocks
  def settle_shape(shape)
    raise "Settling shape in already settled area" if collides?(shape)
    shape.blocks.each { |block| @settled_blocks[block.x][block.y] = block }
  end
  
  # Breakup when lines are completed T
  # TODO revise method name and comments
  def break_rows
    broken_rows = 0
    (@height-1).downto(0) do |i|
      while row_complete?(i)
        shift_down_row(i) 
        broken_rows = broken_rows + 1
      end
    end
    return broken_rows
  end
  
  # Draw a border on the board
  def draw
    border = @game_window.resources["border"]
    
    # Horizontal borders
    0.upto(@width+1) do |i|
      border.draw(i*BLOCK_SIZE, 0)
      border.draw(i*BLOCK_SIZE, (@height+1)*BLOCK_SIZE)
    end
    
    # Vertical borders
    1.upto(@height) do |i|
      border.draw(0, i*BLOCK_SIZE)
      border.draw((@width+1)*BLOCK_SIZE, i*BLOCK_SIZE)      
    end
    
    # Settled blocks
    @settled_blocks.each do |array|
      array.each do |block|
        next if block.nil?
        block_image = @game_window.resources[block.color]
        block_image.draw(BLOCK_SIZE*(block.x+1), BLOCK_SIZE*(block.y+1))
      end
    end
  end
  
  private
  
  def row_complete?(row_index)
    0.upto(@width-1) { |i| return false if @settled_blocks[i][row_index].nil? }
    return true
  end
  
  def clear_row(row_index)
    0.upto(@width-1) { |i| @settled_blocks[i][row_index] = nil }
  end
  
  def shift_down_row(row_index)
    clear_row(row_index)
    return if row_index == 0
    0.upto(@width-1) do |i| 
      @settled_blocks[i][row_index] = @settled_blocks[i][row_index-1]
      @settled_blocks[i][row_index].y = @settled_blocks[i][row_index].y + 1 if !@settled_blocks[i][row_index].nil?
    end
    shift_down_row(row_index-1)
  end
  
end