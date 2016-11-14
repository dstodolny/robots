require "spec_helper"

describe Robots::Commands::L do
  describe "#execute!" do
    it "changes robot's orientation anti-clockwise" do
      robot = double(orientation: :north)
      grid = double

      expect(robot).to receive(:set_orientation).with(:west)

      described_class.new(robot, grid).execute!
    end
  end
end
