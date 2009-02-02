#!/usr/bin/env ruby -wKU
# 
#  game_window.rb
#  falling_stuff
#  
#  Created by Paulo Schneider on 2007-12-25.
#  Copyright 2007 Jeek Labs. All rights reserved.
# 

class GameWindow < Slick::BasicGame
  
  attr_reader :resources, :states
  
  def initialize
    super("Falling Stuff")
  end
  
  def init(container)
    @input = container.get_input
    
    load_resources
    
    @states = Hash.new
    @states[:start] = StartState.new(self)
    @states[:play]  = PlayState.new(self)
    @states[:pause] = PauseState.new(self)
    @states[:end]   = EndState.new(self)
    @current_state  = @states[:start]
  end
  
  def update(container, delta)
    @current_state.update
  end
  
  def render(container, graphics)
    @current_state.draw
  end
  
  def keyPressed(key, char)
    @current_state.button_down(key)
  end
  
  def keyReleased(key, char)
    @current_state.button_up(key) if @current_state.respond_to? "button_up"
  end
  
  def change_state(state)
    @current_state = @states[state]
    @current_state.on_enter
  end
  
  def button_down?(key)
    @input.is_key_down(key)
  end

  private
  
  def load_resources
    # Images
    @resources = Hash.new
    @resources["splash"] = Slick::Image.new("resources/images/splash.png")
    @resources["border"] = Slick::Image.new("resources/images/moldura.png")
    @resources["score"]  = Slick::Image.new("resources/images/score.png")
    @resources["next"]   = Slick::Image.new("resources/images/next.png")
    @resources["esc2pause"]  = Slick::Image.new("resources/images/esc2pause.png")
    @resources["copyrite"]   = Slick::Image.new("resources/images/copyrite.png")
    @resources["paused"]     = Slick::Image.new("resources/images/pause.png")
    @resources["gameovered"] = Slick::Image.new("resources/images/gameover.png")
    
    @resources["gray"]   = Slick::Image.new("resources/images/tetris-cinza.png")
    @resources["yellow"] = Slick::Image.new("resources/images/tetris-amarelo.png")
    @resources["blue"]   = Slick::Image.new("resources/images/tetris-azul.png")
    @resources["pink"]   = Slick::Image.new("resources/images/tetris-rosa.png")
    @resources["green"]  = Slick::Image.new("resources/images/tetris-verde.png")
    @resources["red"]    = Slick::Image.new("resources/images/tetris-vermelho.png")
    @resources["dgreen"] = Slick::Image.new("resources/images/tetris-azulescuro.png")
    
    # Sounds
    @resources["startup"]  = Slick::Sound.new("resources/sounds/splash.wav")
    @resources["settle"]   = Slick::Sound.new("resources/sounds/chao.wav")
    @resources["gameover"] = Slick::Sound.new("resources/sounds/gameover.wav")
    @resources["break"]    = Slick::Sound.new("resources/sounds/linha.wav")
    @resources["pause"]    = Slick::Sound.new("resources/sounds/pausa.wav")
    @resources["start"]    = Slick::Sound.new("resources/sounds/start.wav")
  end

end

#
#
#
class StartState
  
  def initialize(game_window)
    @game_window = game_window
    @start_timestamp = Time.now.to_f
    @played_startup_sound = false
  end
  
  def on_enter
  end
  
  def update
    if !@played_startup_sound && Time.now.to_f - @start_timestamp > 0.5 #500
      @game_window.resources["startup"].play
      @played_startup_sound = true
    end
  end
  
  def draw
    @game_window.states[:play].draw
    @game_window.resources["splash"].draw(BLOCK_SIZE, BLOCK_SIZE)
  end
  
  def button_down(id)
    case id
    when Slick::Input::KEY_ENTER
      @game_window.resources["start"].play
      @game_window.change_state(:play)
    end
  end
  
end

#
#
#
class PlayState
  
  def initialize(game_window)
    @game_window = game_window
    startup
  end
  
  def startup
    initialize_controls
    @shapes = [IShape, OShape, SShape, ZShape, LShape, JShape, TShape]

    @board = Board.new(@game_window)
    
    @score = 0
    @score_table = [0, 40, 100, 300, 1200]
    @level = 0
    @next_shape = @shapes[rand(@shapes.size)].new(@game_window, 0, 0)
    new_shape
    @timer = Time.now.to_f
    @control_timer = nil
    
    @fall_speed = 0.45 #450
    @speed_counter = 0

    ttf = Java::Font.create_font(Java::Font::TRUETYPE_FONT,
            Slick::ResourceLoader::getResourceAsStream("resources/fonts/prstart.ttf")).derive_font(Java::Font::PLAIN, 10)
    @font = Slick::TrueTypeFont.new(ttf, false)
  end
  
  def on_enter
    
  end
  
  def update
    # Go down a space
    if (Time.now.to_f - @timer) > @fall_speed
      @shape.move_down
      if @board.collides?(@shape) 
        @game_window.resources["settle"].play
        @shape.move_up
        @board.settle_shape(@shape)
        add_to_score(@board.break_rows)
        new_shape
        
        # Check gameover
        @game_window.change_state(:end) if @board.collides?(@shape)
      end      
      @timer = Time.now.to_f
    end
    
    # Perform key presses
    if @game_window.button_down?(Slick::Input::KEY_DOWN)
      @shape.move_down
      @shape.move_up if @board.collides?(@shape)
    end
    
    # HACK CODE BELOW!
    return if (@control_timer == nil || Time.now.to_f - @control_timer[1] < 0.600)
    @shape.send(@action[@control_timer[0]]) while !@board.collides?(@shape)
    @shape.send(@undo[@control_timer[0]])
    @control_timer = nil
  end
  
  def button_down(id)
    @control_timer = nil
    case id
    when Slick::Input::KEY_SPACE
      @shape.move_down while !@board.collides?(@shape)
      @shape.move_up
    when Slick::Input::KEY_ESCAPE
      @game_window.change_state(:pause)
    end
    
    if @action.has_key? id
      @control_timer = [id, Time.now.to_f] if id == Slick::Input::KEY_LEFT || id == Slick::Input::KEY_RIGHT
      @shape.send(@action[id]) 
      @shape.send(@undo[id]) if @board.collides?(@shape)
    end    
  end
  
  def button_up(id)
    @control_timer = nil
  end
  
  def draw
    @board.draw
    @shape.draw(BOARD_START_X, BOARD_START_Y)
    @game_window.resources["score"].draw(265, 35)
    @font.draw_string(330 - @font.get_width(@score.to_s), 55, @score.to_s)
    @game_window.resources["next"].draw(270, 130)
    @next_shape.draw(NEXT_SHAPE_X, NEXT_SHAPE_Y)
    @game_window.resources["esc2pause"].draw(245, 350)
    @game_window.resources["copyrite"].draw(245, 400)
  end
  
  def add_to_score(lines)
    @score = @score + (@score_table[lines] * (@level + 1))
    @speed_counter = @speed_counter + lines
    
    # Increase speed
    if @speed_counter >= 4
      @fall_speed = @fall_speed - 0.030
      @speed_counter = 4 - @speed_counter
      @level = @level + 1
    end
    
    @game_window.resources["break"].play if lines > 0
  end
  
  def new_shape
    @shape = @next_shape #.class.new(self, (@board.width/2)-1, 0)
    @shape.position((@board.width/2)-1, 0)
    
    @next_shape = @shapes[rand*@shapes.size].new(@game_window, 0, 0)
  end
  
  def initialize_controls
    @action = Hash.new
    @undo = Hash.new
    @action[Slick::Input::KEY_LEFT]  = "move_left"
    @undo[Slick::Input::KEY_LEFT]    = "move_right"
    @action[Slick::Input::KEY_RIGHT] = "move_right"
    @undo[Slick::Input::KEY_RIGHT]   = "move_left"
    # @action[Slick::Input::KbDown]  = "move_down"
    # @undo[Slick::Input::KbDown]    = "move_up"
    @action[Slick::Input::KEY_UP]    = "rotate_counter_clockwise"
    @undo[Slick::Input::KEY_UP]      = "rotate_clockwise"    
  end
  
end

#
#
#
class PauseState
  
  def initialize(game_window)
    @game_window = game_window
  end
  
  def on_enter
    @game_window.resources["pause"].play
  end

  def update

  end

  def draw
    @game_window.states[:play].draw
    @game_window.resources["paused"].draw(30, 150)
  end

  def button_down(id)
    case id
    when Slick::Input::KEY_ESCAPE
      @game_window.change_state(:play)
    when Slick::Input::KEY_Q
      Java::System::exit(0)
    when Slick::Input::KEY_R
      @game_window.states[:play].startup
      @game_window.change_state(:play)
    end
  end
end

#
#
#
class EndState
  
  def initialize(game_window)
    @game_window = game_window
  end
  
  def on_enter
    @game_window.resources["gameover"].play
  end

  def update

  end

  def draw
    @game_window.states[:play].draw
    @game_window.resources["gameovered"].draw(40, 180)
  end

  def button_down(id)
    case id
    when Slick::Input::KEY_ENTER
      @game_window.states[:play].startup
      @game_window.change_state(:play)
    end
  end
end