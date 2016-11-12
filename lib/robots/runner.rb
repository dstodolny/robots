module Robots
  class Runner
    attr_reader :instruction_parser

    def initialize(instructions: , instruction_parser: nil)
      @instructions = instructions
      @instruction_parser = instruction_parser || InstructionParser.new
    end

    def call
      # TODO
    end
  end
end
