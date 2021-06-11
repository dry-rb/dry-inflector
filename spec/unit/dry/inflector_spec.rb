# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  subject(:inflector) { described_class.new }

  describe "#to_s" do
    specify do
      expect(inflector.to_s).to eql("#<Dry::Inflector>")
    end
  end

  describe "#inspect" do
    specify do
      expect(inflector.method(:inspect)).to eql(inflector.method(:to_s))
    end
  end
end
