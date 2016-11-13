module Robots
  class InstructionParser
    WorldParams = Struct.new(:grid, :objects)
    GridParams = Struct.new(:width, :height)
    ObjectParams = Struct.new(:x, :y, :orientation, :actions)

    attr_reader :instructions

    def initialize(instructions: , syntax_checker: nil)
      @instructions = instructions
      @syntax_checker = syntax_checker || SyntaxChecker.new
    end

    def parse
      @syntax_checker.check(instructions)

      WorldParams.new(grid_params, object_params_collection)
    end

    private

    def instructions_array
      @instructions_array ||= instructions.split("\n").reject(&:empty?)
    end

    def grid_params
      width, height = instructions_array.first.split("\s").reject(&:empty?).map(&:to_i)

      GridParams.new(width, height)
    end

    def object_params_collection
      params_collection = []

      instructions_array[1..-1].reject(&:empty?).each_slice(2) do |object_instructions|
        object_params = object_instructions.first.split("\s").reject(&:empty?)

        x = object_params[0].to_i
        y = object_params[1].to_i
        orientation = Robots::COMPAS[object_params[2]]

        actions = object_instructions.last

        params_collection << ObjectParams.new(x, y, orientation, actions)
      end

      params_collection
    end
  end
end
