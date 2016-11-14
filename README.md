# Robots

The surface of Mars is modelled by a rectangular grid around which robots are able to move according to instructions provided from Earth. This program determines each sequence of robot positions and reports the final position of the robot.

Since the grid is rectangular and bounded (…yes Mars is a strange planet), a robot that moves “off” an edge of the grid is lost forever. However, lost robots leave a robot “scent” that prohibits future robots from dropping off the world at the same grid point. The scent is left at the last grid position the robot occupied before disappearing over the edge. An instruction to move “off” the world from a grid point from which a robot has been previously lost is simply ignored by the current robot.

## Instalation

Build the gem:

```ruby
rake build
```

And then install:

```ruby
gem install pkg/favourite_language-0.1.0.gem
```

Alternatively you can run the script directly from the `bin` directory without building and installing the gem.

```ruby
ruby -Ilib bin/robots
```

## Usage

To execute instructions execute the script and type them on the fly until `EOF` has been reached `(CTRL-D)`.

```ruby
robots
```

You can provide external instructions file as an input to the program.

```ruby
robots < instructions_file
```

As an example you can use a spec fixture as an input.

```ruby
robots < spec/fixtures/example
```

## Instructions

The first line of input is the upper-right coordinates of the rectangular world, the lower-left coordinates are assumed to be `(0, 0)`. The remaining input consists of a sequence of robot positions and instructions (two lines per robot). A position consists of two integers specifying the initial coordinates of the robot and an orientation (`N`, `S`, `E`, `W`), all separated by whitespace on one line.  A robot commands is a string of the letters on one line.

At the moment following robot commands are available:

```
- F: the robot moves forward one grid point in the direction of the current orientation and maintains the same orientation.
- R: the robot turns right 90 degrees and remains on the current grid point
- L: the robot turns left 90 degrees and remains on the current grid point
```

## Extending robot commands

Robot commands can be easily extended. Create a new file with the name `[LETTER].rb` and place it in the `lib/robots/commands` directory. Use the template mentioned below for you robot instruction implementation. After that, you will be able to use `[LETTER]` as a new robot command.

```ruby
module Robots
  module Commands
    class [LETTER]
      def initialize(robot, grid)
        @robot = robot
        @grid = grid
      end

      def execute!
        # Your implementation
      end
    end
  end
end
```
