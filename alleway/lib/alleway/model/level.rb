class Level
  
  attr_reader :pad, :ball, :blocks
  
  def initialize
    @pad = Pad.new(PAD_CONFIG)
    @blocks = [Block.new({:x => 200, :y => 40}.merge(BLOCK_DIMENSIONS))]
    @ball = Ball.new(BALL_CONFIG, @pad, Wall.sections, @blocks)
  end
  
end