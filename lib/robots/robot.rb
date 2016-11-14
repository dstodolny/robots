module Robots
  class Robot
    attr_accessor :orientation, :position
    attr_reader :commands, :status

    def initialize(position:, orientation:, commands:, status: :operating)
      @position = position
      @orientation = orientation
      @commands = commands
      @status = status
    end

    def lose!
      @status = :lost
    end

    def lost?
      status == :lost
    end

    def set_position(new_position)
      @position = new_position
    end
  end
end
