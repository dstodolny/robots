require "spec_helper"

describe Robots do
  it "has a version number" do
    expect(Robots::VERSION).not_to be nil
  end

  it "consumes instructions and generates correct output" do
    instructions = IO.read(File.dirname(__FILE__) + "/fixtures/example")
    output = IO.read(File.dirname(__FILE__) + "/fixtures/example.out")

    expect(Robots::Runner.new(instructions: instructions).execute).to eq(output)
  end
end
