module Robots
  class SyntaxChecker
    class InstructionsSyntaxError < StandardError; end

    GRID_PARAMS_REGEXP = /^\s*\d+\s*\d+\s*$/
    OBJECT_POSITION_REGEXP = /^\s*\d+\s*\d+\s*[nwse]\s*$/i
    OBJECT_ACTIONS_REGEXP = /^\s*[a-z]+\s*$/i

    def check(instructions)
      instructions_array = instructions.split("\n").reject(&:empty?)

      raise InstructionsSyntaxError unless instructions_array.first =~ GRID_PARAMS_REGEXP

      instructions_array[1..-1].each_slice(2) do |object_instructions|
        unless object_instructions[0] =~ OBJECT_POSITION_REGEXP &&
            object_instructions[1] =~ OBJECT_ACTIONS_REGEXP
          raise InstructionsSyntaxError
        end
      end
    end
  end
end
