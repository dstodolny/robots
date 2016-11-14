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
      position = Vector[0, 0]
      grid = described_class.new(width: 4, height: 4)

      grid.set_scented_position(position)

      expect(grid.scented_positions).to include(position)
    end
  end

  describe "#outside?" do
    it "returns true if position x is greater than grid's width" do
      grid = described_class.new(width: 2, height: 2)
      position = Vector[3, 2]

      expect(grid.outside?(position)).to eq(true)
    end

    it "returns true if position x is less than 0" do
      grid = described_class.new(width: 2, height: 2)
      position = Vector[-1, 2]

      expect(grid.outside?(position)).to eq(true)
    end

    it "returns true if position y is greater than grid's height" do
      grid = described_class.new(width: 2, height: 2)
      position = Vector[2, 3]

      expect(grid.outside?(position)).to eq(true)
    end

    it "returns true if position y is less than 0" do
      grid = described_class.new(width: 2, height: 2)
      position = Vector[2, -1]

      expect(grid.outside?(position)).to eq(true)
    end

    it "returns false if position is inside the grid" do
      grid = described_class.new(width: 2, height: 2)
      position = Vector[1, 2]

      expect(grid.outside?(position)).to eq(false)
    end
  end

  describe "#scented?" do
    it "returns true if position is in scented positions" do
      grid = described_class.new(width: 2, height: 2)
      position = Vector[1, 0]

      grid.scented_positions.push(position)

      expect(grid.scented?(position)).to eq(true)
    end

    it "returns false if position is not in scented positions" do
      grid = described_class.new(width: 2, height: 2)
      position = Vector[1, 0]

      expect(grid.scented?(position)).to eq(false)
    end
  end
end
