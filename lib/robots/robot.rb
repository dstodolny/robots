module Robots
  class Robot
    attr_reader :position, :orientation

    def initialize(position:, orientation:)
      @position = position
      @orientation = orientation
    end
  end
end
