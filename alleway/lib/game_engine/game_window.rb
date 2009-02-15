module Engine
  
  class GameWindow < Gosu::Window
    
    def initialize(name, width, height)
      super(width, height, false)
      self.caption = name
    end
    
    def add_screen(screen_name)
      @current_screen = screen_name.new(self)
    end
  
    def update
      @current_screen.update
    end

    def draw
      @current_screen.draw
    end
  
    def button_down(id)
      @current_screen.button_down(id)
    end
    
  end
end