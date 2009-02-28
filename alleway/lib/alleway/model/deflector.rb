class Deflector < Engine::GameObject
  
  def initialize(config_options={:x => 0, :y => 0, :width => 0, :height => 0})
    super(config_options)
    @deflect_action = nil
    @collision_timeout = 0
  end
  
  def deflect_and_adjust(ball)
    @collision_timeout -= 1 if @collision_timeout > 0
    return unless @collision_timeout.zero? && collide?(ball)

    # FIXME refactor this logic
    intersection_rect = intersection(ball)
    if intersection_rect.width >= intersection_rect.height
      if y_center < intersection_rect.y_center
        ball.velocity.y = ball.velocity.y.abs
      else
        ball.velocity.y = -ball.velocity.y.abs
      end
    else
      if x_center < intersection_rect.x_center
        ball.velocity.x = ball.velocity.x.abs
      else
        ball.velocity.x = -ball.velocity.x.abs
      end
    end
    
    ball.velocity.adjust(deflection_modifier(ball))
    @deflect_action.call() if @deflect_action
    @collision_timeout = 5
  end
  
  def when_deflect(&action)
    @deflect_action = action
  end
  
  protected
  
  def deflection_modifier(ball)
    0
  end
  
end