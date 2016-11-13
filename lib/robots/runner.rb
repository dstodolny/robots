module Robots
  class Runner
    attr_reader :instructions

    def initialize(instructions:, instruction_parser: nil, grid: nil)
      @instructions = instructions
      @instruction_parser = instruction_parser ||
        InstructionParser.new(instructions: instructions)
      @grid = grid ||
        Grid.new(
          width: world_params[:grid][:width],
          height: world_params[:grid][:height]
        )
    end

    def execute
      # TODO
    end
  end
end
