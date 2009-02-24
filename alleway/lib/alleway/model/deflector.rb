class Deflector < Engine::GameObject
  
  def intialize
    super()
  end
  
  def deflect_and_adjust(ball)
    return unless collide?(ball)
    
    intersection_rect = intersection(ball)
    if intersection_rect.width >= intersection_rect.height
      ball.velocity.y = -ball.velocity.y
    else
      ball.velocity.x = -ball.velocity.x
    end
  end
  
  protected
  
  def deflection_modifier(ball)
    0
  end
  
end