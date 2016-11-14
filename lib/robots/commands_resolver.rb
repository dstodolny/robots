module Robots
  class CommandsResolver
    def resolve(robot, grid)
      robot.commands.split("").each do |command|
        break if robot.lost?

        command_class(command).new(robot, grid).execute!
      end
    end

    private

    def command_class(command)
      begin
        "Robots::Commands::#{command}".split("::").inject(Object) { |o,c| o.const_get c }
      rescue NameError
        Robots::Commands::NoCommand
      end
    end
  end
end
