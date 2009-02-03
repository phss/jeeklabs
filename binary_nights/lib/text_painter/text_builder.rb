# 
#  text_builder.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-28.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# Build object representations based on text
#
class TextBuilder
  
  def initialize(game_window, bitmap_font, font_size)
    @game_window = game_window
    @font_size = font_size
    @image = Gosu::Image.load_tiles(game_window, bitmap_font, font_size, font_size, false)
  end
  
  def build_representation_for(object, text, color=Gosu::white)
    if text.class == String
      build_representation_from_text(object, text, color)
    else
      build_representation_from_bytes(object, text, color)
    end
  end
  
  #private
  
  def build_representation_from_bytes(game_object, bytes, color=Gosu::white)
    sprites = []
    
    pos_x = 0
    pos_y = 0
    bytes.each do |byte|
      if byte == 10  # \n character
        pos_x -= @font_size
        pos_y += @font_size
        next
      end
      sprites << Sprite.new(@image[byte], pos_x, pos_y, color)
      pos_x += @font_size
    end
    
    representation = SpriteRepresentation.new(@game_window, game_object, sprites)
  end
  
  def build_representation_from_text(game_object, text, color=Gosu::white)
    bytes = []
    text.each_byte { |byte| bytes << byte }
    build_representation_from_bytes(game_object, bytes, color)
  end
  
  
end