#!/usr/bin/env ruby -wKU

require "lib/binary_nights"

# HACK HACK HACK
def generate_tentacles(game, middle, height)
  tentacles = []
  tentacle_diff = height/3
  3.times do |i|
    tentacles << Tentacle.new(game, RingPoint.new(middle, i*tentacle_diff), 
                                            RingPoint.new(middle, (i+1)*tentacle_diff), 
                                            RingPoint.new(middle, (i+0.5)*tentacle_diff))
  end
  return tentacles
end
# HACK HACK HACK


MATCH = Match.from_spec(MATCH_SPEC)

game = GameWindow.new("Binary Nights", WINDOW_WIDTH, WINDOW_HEIGHT)
game.add_representation_builder(:text, TextBuilder.new(game, "data/fonts/font.png", FONT_SIZE))
game_flow = GameFlow.new(game, MATCH)
ai_pad = AIPadController.new(MATCH.right_pad, MATCH.ball)
tentacles = generate_tentacles(game, game.width/2, game.height)

game.screen :game do
  with_representation(TentacleRepresentation.new(game, tentacles, MATCH.court))
  text_representation_for(MATCH.left_pad, PAD_TEXT, Gosu::black).with_input_control do
     when_key(Gosu::KbUp)   { move_up }
     when_key(Gosu::KbDown) { move_down }
  end
  text_representation_for(ai_pad, PAD_TEXT).will_always { react }
  
  text_representation_for(MATCH.ball, BALL_TEXT, Gosu::red).will_always { move }
end
  
game.screen :goal_scored do
  render_screen :game
  with_representation(TentacleRepresentation.new(game, tentacles, MATCH.court)).will_always { grow }
end
  
game.start_with :game