module Engine
  
  class GameObject
    attr_accessor :x, :y, :width, :height
      
    def initialize(config_options={:x => 0, :y => 0, :width => 0, :height => 0})
      configure_with(config_options)
    end
  
    def at(x, y)
      @x = x
      @y = y
    end
  
    def dimension(width, height)
      @width = width
      @height = height
    end
    
    # config_options is a hash that can take the following keys: :x, :y, :width, :height. 
    # The key restriction is not being enforced.
    def configure_with(config_options)
      config_options.each { |attribute, value| eval "self.#{attribute} = #{value}" }
    end
  
    def collide?(obj)
      !(obj.x > (@x + @width)  || @x > (obj.x + obj.width) ||
        obj.y > (@y + @height) || @y > (obj.y + obj.height))
    end
    
    def intersection(obj)
      return nil unless collide?(obj)
      
      intersection = GameObject.new # FIXME should create a rect class
      # FIXME silly min/max bellow
      intersection.x = [@x, obj.x].max
      intersection.y = [@y, obj.y].max
      intersection.width = [@x + @width, obj.x + obj.width].min - intersection.x
      intersection.height = [@y + @height, obj.y + obj.height].min - intersection.y
      return intersection      
    end
  
    def x_center
      @x + (@width/2)
    end
  
  end
  
end