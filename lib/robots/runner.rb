module Robots
  class Runner
    attr_reader :instructions, :robots, :grid

    def initialize(instructions:, instruction_parser: nil, grid: nil, commands_resolver: nil, status_builder: nil)
      @instructions = instructions
      @instruction_parser = instruction_parser ||
        InstructionParser.new(instructions: instructions)
      @grid = grid ||
        Grid.new(width: grid_params[:width], height: grid_params[:height])
      @commands_resolver = commands_resolver || CommandsResolver.new
      @status_builder = status_builder || StatusBuilder.new
      @robots = []
    end

    def execute
      place_robots

      robots.each do |robot|
        @commands_resolver.resolve(robot, grid)
      end

      @status_builder.build(robots)
    end

    private

    def world_params
      @world_params ||= @instruction_parser.parse
    end

    def grid_params
      world_params[:grid]
    end

    def objects_instructions
      world_params[:objects]
    end

    def place_robots
      objects_instructions.each do |object_instructions|
        robots.push(place_robot(object_instructions))
      end
    end

    def place_robot(robot_instructions)
      Robot.new(
        position: Vector[robot_instructions[:x], robot_instructions[:y]],
        orientation: robot_instructions[:orientation],
        commands: robot_instructions[:commands]
      )
    end
  end
end
