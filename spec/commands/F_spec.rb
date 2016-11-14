require "spec_helper"

describe Robots::Commands::F do
  describe "#execute!" do
    context "when the new position is inside the grid" do
      it "moves north when robot orientation is :north" do
        grid = double
        allow(grid).to receive(:outside?).and_return(false)
        allow(grid).to receive(:scented?).and_return(false)
        robot = double(position: Vector[1, 1], orientation: :north)
        new_position = Vector[1, 2]

        expect(robot).to receive(:set_position).with(new_position)

        described_class.new(robot, grid).execute!
      end

      it "moves east when robot orientation is :east" do
        grid = double
        allow(grid).to receive(:outside?).and_return(false)
        allow(grid).to receive(:scented?).and_return(false)
        robot = double(position: Vector[1, 1], orientation: :east)
        new_position = Vector[2, 1]

        expect(robot).to receive(:set_position).with(new_position)

        described_class.new(robot, grid).execute!
      end

      it "moves south when robot orientation is :south" do
        grid = double
        allow(grid).to receive(:outside?).and_return(false)
        allow(grid).to receive(:scented?).and_return(false)
        robot = double(position: Vector[1, 1], orientation: :south)
        new_position = Vector[1, 0]

        expect(robot).to receive(:set_position).with(new_position)

        described_class.new(robot, grid).execute!
      end

      it "moves west when robot orientation is :west" do
        grid = double
        allow(grid).to receive(:outside?).and_return(false)
        allow(grid).to receive(:scented?).and_return(false)
        robot = double(position: Vector[1, 1], orientation: :west)
        new_position = Vector[0, 1]

        expect(robot).to receive(:set_position).with(new_position)

        described_class.new(robot, grid).execute!
      end
    end

    context "when the new position is outside the grid" do
      context "and robot is not in scented position" do
        it "sets robot status to lost and marks robot position as scented" do
          grid = double
          allow(grid).to receive(:outside?).and_return(true)
          allow(grid).to receive(:scented?).and_return(false)
          robot = double(position: Vector[1, 1], orientation: :west)

          expect(robot).to receive(:lose!)
          expect(grid).to receive(:set_scented_position).with(robot.position)

          described_class.new(robot, grid).execute!
        end
      end

      context "and robot is in scented position" do
        it "ignores the command" do
          grid = double
          allow(grid).to receive(:outside?).and_return(true)
          allow(grid).to receive(:scented?).and_return(true)
          robot = double(position: Vector[1, 1], orientation: :west)

          expect(robot).not_to receive(:lose!)
          expect(grid).not_to receive(:set_scented_position).with(robot.position)

          described_class.new(robot, grid).execute!
        end
      end
    end
  end
end
