require "spec_helper"

describe Robots::Commands::R do
  describe "#execute!" do
    it "changes robot's orientation clockwise" do
      robot = double(orientation: :north)
      grid = double

      expect(robot).to receive(:set_orientation).with(:east)

      described_class.new(robot, grid).execute!
    end
  end
end
