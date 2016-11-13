module Robots
  class Grid
    class CoordinateValueError < StandardError; end

    MAX_COORDINATE = 50.freeze

    attr_reader :scented_positions

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
  end
end