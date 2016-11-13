require "spec_helper"

describe Robots::Robot do
  describe "#initialize" do
    it "creates new robot with specified position and orientation" do
      position = double
      orientation = ::Robots::COMPAS.values.sample

      robot = described_class.new(position: position, orientation: orientation)

      expect(robot.position).to eq(position)
      expect(robot.orientation).to eq(orientation)
    end
  end
end
