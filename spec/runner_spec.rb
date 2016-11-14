require "spec_helper"

describe Robots::Runner do
  describe "#execute" do
    it "consumes instructions and generates correct output" do
      instructions = IO.read(File.dirname(__FILE__) + "/fixtures/example")
      output = IO.read(File.dirname(__FILE__) + "/fixtures/example.out")

      expect(described_class.new(instructions: instructions).execute).to eq(output)
    end
  end
end
