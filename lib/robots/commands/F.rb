module Robots
  module Commands
    class F
      def initialize(robot, grid)
        @robot = robot
        @grid = grid
      end

      def execute!
        new_position = @robot.position + Robots::UNIT_VECTORS[@robot.orientation]

        if @grid.outside?(new_position) && !@grid.scented?(@robot.position)
            @robot.lose!
            @grid.set_scented_position(@robot.position)
        elsif !@grid.outside?(new_position)
          @robot.set_position(new_position)
        end
      end
    end
  end
end
