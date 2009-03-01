class Wall
  
  def self.sections
    [
      Deflector.new({:x => -10, :y => -10, :width => 10, :height => WINDOW_HEIGHT + 10}),
      Deflector.new({:x => -10, :y => -10, :width => WINDOW_WIDTH + 10, :height => 10}),
      Deflector.new({:x => WINDOW_WIDTH, :y => -10, :width => 10, :height => WINDOW_HEIGHT + 10})
    ]
  end
    
end