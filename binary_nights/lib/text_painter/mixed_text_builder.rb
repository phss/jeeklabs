#!/usr/bin/env ruby -wKU
# 
#  mixed_text_builder.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-08-07.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

class MixedTextBuilder
  def initialize(text_builder)
    @text_builder = text_builder
  end
  
  def build_representation_for(object, text)
    obj_rep = @text_builder.build_representation_for(object, text)
    (text.size/2).times { |i| obj_rep.sprites[i].color = Gosu::black }
    return obj_rep
  end
end