require "spec_helper"

describe Robots::SyntaxChecker do
  INCORRECT_INSTRUCTIONS = [
    "",
    "abc",
    "1",
    "1 1\nabc",
    "1 1\n1 1 E",
    "1 1\n1 1 F\nRFRF",
    "1 1\n1 1 N\nRFRF\n1 1 N"
  ]

  describe "#check" do
    context "with incorrect instructions" do
      it "raises an InstructionsSyntaxError if the first line does not describe the grid" do
        INCORRECT_INSTRUCTIONS.each do |instructions|
          expect { described_class.new.check(instructions) }.to raise_error(Robots::SyntaxChecker::InstructionsSyntaxError)
        end
      end
    end

    context "with correct instructions" do
      it "does not raise any error if the first line describes the grid" do
        instructions = load_instructions

        expect { described_class.new.check(instructions) }.to_not raise_error
      end
    end
  end

  def load_instructions
    IO.read(File.dirname(__FILE__) + "/fixtures/example")
  end
end
