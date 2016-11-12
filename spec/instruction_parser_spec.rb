require "spec_helper"

describe Robots::InstructionParser do
  describe "#call" do
    it "generates a struct with correct grid parameters" do
      instructions = load_instructions

      world_params = described_class.new(instructions).call

      expect(world_params[:grid][:width]).to eq(5)
      expect(world_params[:grid][:height]).to eq(3)
    end

    it "generates a struct with correct objects" do
      instructions = load_instructions

      world_params = described_class.new(instructions).call

      expect(world_params[:objects].size).to eq(3)
      expect(world_params[:objects][0][:x]).to eq(1)
      expect(world_params[:objects][0][:y]).to eq(1)
      expect(world_params[:objects][0][:orientation]).to eq(:east)
      expect(world_params[:objects][0][:actions]).to eq("RFRFRFRF")
    end
  end

  def load_instructions
    IO.read(File.dirname(__FILE__) + "/fixtures/example")
  end
end
