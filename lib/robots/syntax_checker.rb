module Robots
  class SyntaxChecker
    class InstructionsSyntaxError < StandardError; end

    GRID_PARAMS_REGEXP = /^\s*\d+\s*\d+\s*$/
    ROBOT_POSITION_REGEXP = /^\s*\d+\s*\d+\s*[nwse]\s*$/i
    ROBOT_ACTIONS_REGEXP = /^\s*[a-z]+\s*$/i

    def call(instructions)
      instructions = instructions.split("\n").reject(&:empty?)

      raise InstructionsSyntaxError unless instructions.first =~ GRID_PARAMS_REGEXP
      instructions[1..-1].each_slice(2) do |robot_instructions|
        unless robot_instructions[0] =~ ROBOT_POSITION_REGEXP &&
            robot_instructions[1] =~ ROBOT_ACTIONS_REGEXP
          raise InstructionsSyntaxError
        end
      end
    end
  end
end
