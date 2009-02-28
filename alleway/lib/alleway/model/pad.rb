class Pad < Deflector
  
  def initialize(config)
    super(config)
  end
  
  def move_left
    @x -= 5
    @x = 0 if @x < 0 # FIXME move this logic elsewhere?
  end
  
  def move_right
    @x += 5
    @x = WINDOW_WIDTH - @width if (@x + @width) > WINDOW_WIDTH # FIXME move this logic elsewhere?
  end
  
  def deflection_modifier(ball)
    (ball.x_center - self.x_center)/(1.5*@width)
  end
  
end