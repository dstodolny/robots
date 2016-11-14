module Robots
  module Commands
    class R
      def initialize(robot, grid)
        @robot = robot
        @grid = grid
      end

      def execute!
        @robot.set_orientation(Robots::ROTATIONS[@robot.orientation])
      end
    end
  end
end
