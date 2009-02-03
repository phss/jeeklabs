# 
#  object_representation.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-28.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

#
# Visual representation of a game object.
#
class ObjectRepresentation
  
  def initialize(game_window, game_object)
    @game_window = game_window
    @game_object = game_object
    @always_actions = []
    @key_actions = {}
  end
  
  def will_always(&action)
    @always_actions << action
  end
  
  def with_input_control(&block)
    instance_eval(&block) # TODO should do something more?
  end
  
  def when_key(key, &action)
    key = @game_window.char_to_button_id(key) if key.class == String
    @key_actions[key] = action
  end
  
  def draw
    # Blah
  end
  
  def update
    @always_actions.each { |action| @game_object.instance_eval(&action) }
    @key_actions.each { |key, action| @game_object.instance_eval(&action) if @game_window.button_down?(key) }
  end
  
end