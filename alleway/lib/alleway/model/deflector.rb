class Deflector < Engine::GameObject
  
  def intialize(config_options={:x => 0, :y => 0, :width => 0, :height => 0})
    super(config_options)
  end
  
  def deflect_and_adjust(ball)
    return unless collide?(ball)
    
    intersection_rect = intersection(ball)
    if intersection_rect.width >= intersection_rect.height
      ball.velocity.y = -ball.velocity.y
    else
      ball.velocity.x = -ball.velocity.x
    end
    ball.velocity.adjust(deflection_modifier(ball))
  end
  
  protected
  
  def deflection_modifier(ball)
    0
  end
  
end