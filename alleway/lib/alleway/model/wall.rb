class Wall < Deflector
  
  def initialize
    @sections = [
      Deflector.new({:x => -10, :y => -10, :width => 10, :height => WINDOW_HEIGHT + 10}),
      Deflector.new({:x => -10, :y => -10, :width => WINDOW_WIDTH + 10, :height => 10}),
      Deflector.new({:x => WINDOW_WIDTH, :y => -10, :width => 10, :height => WINDOW_HEIGHT + 10})
    ]
  end
  
  def deflect_and_adjust(ball)
    @sections.each { |section| section.deflect_and_adjust(ball) }
  end
  
end