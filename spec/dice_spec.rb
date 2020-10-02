require "../dice"

describe Dice do
  describe "#roll" do
    context "when you try to roll aan impossible dice"
    let(:d1) { describe_class.new(1) }
    let(:d0) { describe_class.new(0) }
    let(:dnegative1) { describe_class.new(-1) }

    it "throws an exception if we try to roll a d1" do
      expect { d1.roll }.to raise_error(ArgumentError)
    end

    it "throws an exception if we try to roll a d0" do
      expect { d0.roll }.to raise_error(ArgumentError)
    end

    it "throws an exception if we try to roll a negative sided dice" do
      expect { dnegative1.roll }.to raise_error(ArgumentError)
    end

    context "when one d6 is rolled" do
      subject(:d6) { described_class.new(6) }

      # an example block
      it "rolls between 1 and 6" do
        1000.times do
          # an expectation
          expect(d6.roll).to be_between(1, 6).inclusive
        end
      end
    end

    context "when two d6 are rolled " do
      subject(:d6) { described_class.new(6) }

      it "rolls between 2 and 12" do
        1000.times do
          expect(d6.roll(2)).to be_between(2, 12).inclusive
        end
      end
    end
  end
end
