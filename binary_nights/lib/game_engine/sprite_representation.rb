#!/usr/bin/env ruby -wKU
# 
#  sprite_representation.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-08-08.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 
class SpriteRepresentation < ObjectRepresentation
  
  attr_reader :sprites
  
  def initialize(game_window, game_object, sprites)
    super(game_window, game_object)
    @sprites = sprites
  end
  
  def draw
    @sprites.each do |sprite|
      sprite.draw(@game_object.x, @game_object.y)
    end
  end
    
end