module Robots
  class StatusBuilder
    def build(robots)
      output = ""

      robots.each do |robot|
        output << "#{formatted_position(robot.position)} #{formatted_orientation(robot.orientation)}"
        output << " #{formatted_status(robot.status)}" if robot.lost?
        output << "\n"
      end

      output
    end

    private

    def formatted_position(position)
      "#{position[0]} #{position[1]}"
    end

    def formatted_orientation(orientation)
      COMPAS.invert[orientation]
    end

    def formatted_status(status)
      status.upcase
    end
  end
end
