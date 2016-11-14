require "matrix"
require "robots/version"
require "robots/runner"
require "robots/instruction_parser"
require "robots/syntax_checker"
require "robots/grid"
require "robots/robot"
require "robots/commands_resolver"

Dir[File.dirname(__FILE__) + "/robots/commands/*.rb"].each { |file| require file }

module Robots
  COMPAS = {
    "N" => :north,
    "E" => :east,
    "S" => :south,
    "W" => :west,
  }.freeze

  UNIT_VECTORS = {
    north: Vector[0, 1],
    east:  Vector[1, 0],
    south: Vector[0, -1],
    west:  Vector[-1, 0]
  }.freeze
end
