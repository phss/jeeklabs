class Ball < Engine::GameObject
  
  def initialize(config)
    configure_with(config)
    @speed = 5
    @angle = Math::PI/4
  end
    
  def move
    # @deflectors.each { |deflector| deflector.deflect_and_adjust(self) }
    @x += @speed*Math.cos(@angle)
    @y += @speed*Math.sin(@angle)
  end
  
end