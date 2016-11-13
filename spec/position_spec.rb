require "spec_helper"

describe Robots::Position do
  describe "#initialize" do
    it "creates new position with x and y coordinates" do
      x = 5
      y = 10

      position = described_class.new(x: x, y: y)

      expect(position.x).to eq(x)
      expect(position.y).to eq(y)
    end
  end
end
