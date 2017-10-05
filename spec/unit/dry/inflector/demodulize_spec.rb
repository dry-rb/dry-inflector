# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#demodulize" do
    subject { described_class.new }

    it "demodulizes module name: DataMapper::Inflecto => Inflecto" do
      expect(subject.demodulize(i("DataMapper::Inflecto"))).to eq("Inflecto")
    end

    it "demodulizes module name: A::B::C::D::E => E" do
      expect(subject.demodulize(i("A::B::C::D::E"))).to eq("E")
    end
  end
end
