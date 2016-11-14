require "matrix"
require "robots/version"
require "robots/runner"
require "robots/instruction_parser"
require "robots/syntax_checker"
require "robots/grid"
require "robots/robot"

module Robots
  COMPAS = {
    "N" => :north,
    "E" => :east,
    "S" => :south,
    "W" => :west,
  }.freeze
end
