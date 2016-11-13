module Robots
  class Runner
    attr_reader :instructions

    def initialize(instructions: ,instruction_parser: nil)
      @instructions = instructions
      @instruction_parser = instruction_parser ||
        InstructionParser.new(instructions: instructions)
    end

    def execute
      # TODO
    end
  end
end
