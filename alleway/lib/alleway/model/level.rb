class Level
  
  attr_reader :pad, :ball, :blocks
  
  def initialize
    @pad = Pad.new(PAD_CONFIG)
    @blocks = []
    @ball = Ball.new(BALL_CONFIG, @pad, Wall.sections)
  end
  
  def add_block(block)
    @blocks << block
  end
  
  def self.from(level_file)
    level = Level.new
    
    # FIXME review this initialization logic
    File.open(level_file) do |file|
      row_index = 0
      file.each do |line|
        column_index = 0
        line.split('').each do |char|
          if char.to_i > 0
            block = Block.new({:x => column_index * BLOCK_DIMENSIONS[:width], :y => row_index * BLOCK_DIMENSIONS[:height]}.merge(BLOCK_DIMENSIONS))
            level.add_block(block)
            level.ball.add_deflector(block)
          end
          column_index += 1
        end
        row_index += 1
      end
    end
    return level
  end
  
end