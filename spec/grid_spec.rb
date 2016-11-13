require "spec_helper"

describe Robots::Grid do
  describe "#initialize" do
    it "raised an error if width is greater than MAX_COORDINATE" do
      width = ::Robots::Grid::MAX_COORDINATE + 1
      height = 1

      expect {
        described_class.new(width: width, height: height)
      }.to raise_error(Robots::Grid::CoordinateValueError)
    end

    it "raises an error if height is greater than MAX_COORDINATE" do
      width = 1
      height = ::Robots::Grid::MAX_COORDINATE + 1

      expect {
        described_class.new(width: width, height: height)
      }.to raise_error(Robots::Grid::CoordinateValueError)
    end
  end

  describe "#set_scented_position" do
    it "adds a possition to scented positions list" do
      position = double
      grid = described_class.new(width: 4, height: 4)

      grid.set_scented_position(position)

      expect(grid.scented_positions).to include(position)
    end
  end
end
