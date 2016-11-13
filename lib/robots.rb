require "robots/version"
require "robots/runner"
require "robots/instruction_parser"
require "robots/syntax_checker"
require "robots/grid"

module Robots
  COMPAS = {
    "N" => :north,
    "W" => :west,
    "S" => :south,
    "E" => :east,
  }.freeze
end
