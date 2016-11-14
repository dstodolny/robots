module Robots
  module Commands
    class L
      def initialize(robot, grid)
        @robot = robot
        @grid = grid
      end

      def execute!
        @robot.set_orientation(Robots::ROTATIONS.invert[@robot.orientation])
      end
    end
  end
end
