require "spec_helper"

describe Robots::Robot do
  describe "#initialize" do
    it "creates new robot with specified position and orientation" do
      robot = build_robot

      expect(robot.position).to eq(Vector[1, 1])
      expect(robot.orientation).to eq(:north)
      expect(robot.commands).to eq("FRFR")
      expect(robot.status).to eq(:operating)
    end
  end

  describe "#lose!" do
    it "sets robot's status to lost" do
      robot = build_robot

      robot.lose!

      expect(robot.status).to eq(:lost)
    end
  end

  describe "#lost" do
    it "returns true if robot is lost" do
      robot = build_robot(status: :lost)

      expect(robot.lost?).to eq(true)
    end

    it "returns false if robot is not lost" do
      robot = build_robot

      expect(robot.lost?).to eq(false)
    end
  end

  describe "#set_position" do
    it "sets the new position to the robot" do
      robot = build_robot
      new_position = Vector[2, 2]

      robot.set_position(new_position)

      expect(robot.position).to eq(new_position)
    end
  end

  def build_robot(status: :operating)
    described_class.new(
      position: Vector[1, 1],
      orientation: :north,
      commands: "FRFR",
      status: status
    )
  end
end
