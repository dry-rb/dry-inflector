# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#ordinalize" do
    context "when number ends with digit 1" do
      it "adds -th suffix when number ends with 11" do
        [-1011, -111, -11, 11, 111, 1011].each do |number|
          expect(subject.ordinalize(number)).to eq("#{number}th")
        end
      end

      it "adds -st suffix when number does not end with 11" do
        [-1001, -101, -21, -1, 1, 21, 101, 1001].each do |number|
          expect(subject.ordinalize(number)).to eq("#{number}st")
        end
      end
    end

    context "when number ends with digit 2" do
      it "adds -th suffix when number ends with 12" do
        [-1012, -112, -12, 12, 112, 1012].each do |number|
          expect(subject.ordinalize(number)).to eq("#{number}th")
        end
      end

      it "adds -nd suffix when number does not end with 12" do
        [-1002, -102, -22, -2, 2, 22, 102, 1002].each do |number|
          expect(subject.ordinalize(number)).to eq("#{number}nd")
        end
      end
    end

    context "when number ends with digit 3" do
      it "adds -th suffix when number ends with 13" do
        [-1013, -113, -13, 13, 113, 1013].each do |number|
          expect(subject.ordinalize(number)).to eq("#{number}th")
        end
      end

      it "adds -rd suffix when number does not end with 13" do
        [-1003, -103, -23, -3, 3, 23, 103, 1003].each do |number|
          expect(subject.ordinalize(number)).to eq("#{number}rd")
        end
      end
    end

    it "ordinalizes other numbers with -th suffix" do
      [-4, 4, 5, 6, 7, 8, 9, 10, 14, 15, 16].each do |number|
        expect(subject.ordinalize(number)).to eq("#{number}th")
      end
    end
  end
end
