# 
#  bn.rb
#  binary_nights
#  
#  Created by Paulo Schneider on 2008-05-28.
#  Copyright 2008 Jeek Labs. All rights reserved.
# 

require "lib/binary_nights"

Triangle = Struct.new(:x1, :y1, :x2, :y2, :x3, :y3, :color) do
  def draw(game_window)
    game_window.draw_triangle(x1, y1, color, x2, y2, color, x3, y3, color)
  end
end

class GameWindow < Gosu::Window

  attr_writer :renderer, :match
  
  def initialize
    super(WINDOW_WIDTH, WINDOW_HEIGHT, false)
    self.caption = "Binary Nights"
    @score = 0
    @triangles = []
    
    # throw awat
    @up = false
    @down = false
  end
  
  def update
    @match.left_pad.move_up if button_down?(char_to_button_id('s'))
    @match.left_pad.move_down if button_down?(char_to_button_id('x'))
    @match.right_pad.move_up if button_down?(Gosu::Button::KbUp)
    @match.right_pad.move_down if button_down?(Gosu::Button::KbDown)
    # @match.right_pad.move_up if @up
    # @match.right_pad.move_down if @down
    @match.ball.move
    
    if (@match.ball.x+@match.ball.width < 0)
      @score -= 1
      @match.ball.at(320, 240)
      if @score >= 0
        @triangles.pop
      else
        add_triangle(Gosu::black)
      end
    elsif (@match.ball.x > WINDOW_WIDTH)
      @score += 1
      @match.ball.at(320, 240)
      if @score <= 0
        @triangles.pop
      else
        add_triangle(Gosu::white)
      end
    end
  end
  
  def button_down(id)
    case id
    when Gosu::Button::KbEscape
      exit
    when Gosu::Button::KbReturn
      @match.ball.at(320, 240)
    # when Gosu::Button::KbUp
    #   @up = true
    # when Gosu::Button::KbDown
    #   @match.right_pad.move_down
    end
  end
  
  def add_triangle(color)
    point = 320 + @score*30
    y1 = rand(400)+50
    y2 = y1 - rand(50)
    y3 = y1 + rand(50)
    @triangles.push(Triangle.new(point, y1, 320, y2, 320, y3, color))
  end
  
  def draw
    middle = 320 #+ @score*30
    draw_quad(0, 0, Gosu::white, middle, 0, Gosu::white, 0, 480, Gosu::white, middle, 480, Gosu::white)
    # draw_quad(290, 0, Gosu::white, 350, 0, Gosu::black, 290, 480, Gosu::white, 350, 480, Gosu::black)
    gray = 0xff777777
    light_gray = 0xff333333
    dark_gray = 0xffcccccc
    # draw_quad(310, 0, gray, 330, 0, gray, 310, 480, gray, 330, 480, gray)
    # draw_quad(300, 0, dark_gray, 310, 0, gray, 300, 480, dark_gray, 310, 480, gray)
    # draw_quad(330, 0, gray, 340, 0, light_gray, 330, 480, gray, 340, 480, light_gray)
    @triangles.each { |triangle| triangle.draw(self) }
    
    @renderer.draw_all
  end
  
end

if __FILE__ == $PROGRAM_NAME
  window = GameWindow.new
  
  match = Match.from_spec(MATCH_SPEC)
  
  builder = TextBuilder.new(window, "data/fonts/font.png", FONT_SIZE)
  renderer = Renderer.new
  # renderer.add_representation(builder.build_representation_from_text(match.ball, "@", Gosu::red))
  renderer.add_representation(builder.build_representation_from_bytes(match.ball, [BALL_BYTE], Gosu::red))
  upper_sideline_rep = builder.build_representation_from_text(match.court.sidelines[:upper], "="*36)
  18.times { |i| upper_sideline_rep.sprites[i].color = Gosu::black }
  renderer.add_representation(upper_sideline_rep)
  lower_sideline_rep = builder.build_representation_from_text(match.court.sidelines[:bottom], "="*36)
  18.times { |i| lower_sideline_rep.sprites[i].color = Gosu::black }
  renderer.add_representation(lower_sideline_rep)
  renderer.add_representation(builder.build_representation_from_bytes(match.left_pad, [PAD_BYTE, 10]*5, Gosu::black))
  renderer.add_representation(builder.build_representation_from_bytes(match.right_pad, [PAD_BYTE, 10]*5))
  
  window.renderer = renderer
  window.match = match
  window.show
end