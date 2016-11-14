require "spec_helper"

describe Robots::CommandsResolver do
  describe "#resolve" do
    context "when robot is operating" do
      it "calls matching command instance if action is recognised" do
        robot = build_operating_robot(commands: "F")
        grid = double

        expect_any_instance_of(Robots::Commands::F).to receive(:execute!)

        described_class.new.resolve(robot, grid)
      end

      it "calls NoCommand instance if action is not recognised" do
        robot = build_operating_robot(commands: "%")
        grid = double

        expect_any_instance_of(Robots::Commands::NoCommand).to receive(:execute!)

        described_class.new.resolve(robot, grid)
      end
    end

    context "when robot is lost" do
      it "doesn't call matching command instance" do
        robot = build_lost_robot(commands: "F")
        grid = double

        expect_any_instance_of(Robots::Commands::F).not_to receive(:execute!)

        described_class.new.resolve(robot, grid)
      end

      it "doesn't call NoCommand instance if action is not recognised" do
        robot = build_lost_robot(commands: "%")
        grid = double

        expect_any_instance_of(Robots::Commands::NoCommand).not_to receive(:execute!)

        described_class.new.resolve(robot, grid)
      end
    end
  end

  def build_lost_robot(commands:)
    robot = double(commands: commands)
    allow(robot).to receive(:lost?).and_return(true)
    robot
  end

  def build_operating_robot(commands:)
    robot = double(commands: commands)
    allow(robot).to receive(:lost?).and_return(false)
    robot
  end
end
