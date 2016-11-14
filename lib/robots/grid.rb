module Robots
  class Grid
    class CoordinateValueError < StandardError; end

    MAX_COORDINATE = 50.freeze

    attr_reader :width, :height, :scented_positions

    def initialize(width:, height:)
      if width > MAX_COORDINATE || height > MAX_COORDINATE
        raise CoordinateValueError
      end

      @width = width
      @height = height
      @scented_positions = []
    end

    def set_scented_position(position)
      scented_positions.push(position)
    end

    def scented_positions
      @scented_positions ||= []
    end

    def outside?(position)
      position[0] > width || position[1] > height ||
        position[0] < 0 || position[1] < 0
    end

    def scented?(position)
      scented_positions.include?(position)
    end
  end
end
