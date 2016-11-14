require "spec_helper"

describe Robots::StatusBuilder do
  describe "#build" do
    it "builds correct status from robots attributes" do
      robots = [operating_robot, lost_robot]
      output = "0 1 E\n1 2 N LOST\n"

      expect(described_class.new.build(robots)).to eq(output)
    end
  end

  def operating_robot
    robot = double(position: Vector[0, 1], orientation: :east)
    allow(robot).to receive(:lost?).and_return(false)
    robot
  end

  def lost_robot
    robot = double(position: Vector[1, 2], orientation: :north, status: :lost)
    allow(robot).to receive(:lost?).and_return(true)
    robot
  end
end
