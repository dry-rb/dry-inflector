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

  describe "#freeze" do
    before(:each) do
      inflector.freeze
    end

    it "freezes an inflections" do
      expect { inflector.inflections.plural('ooh', 'ooh') }.to raise_error(FrozenError, "can't modify a frozen inflection")
      expect { inflector.inflections.singular('ooh', 'ooh') }.to raise_error(FrozenError, "can't modify a frozen inflection")
      expect { inflector.inflections.irregular('ooh', 'ooh') }.to raise_error(FrozenError, "can't modify a frozen inflection")
      expect { inflector.inflections.uncountable('ooh') }.to raise_error(FrozenError, "can't modify a frozen inflection")
      expect { inflector.inflections.acronym('ooh') }.to raise_error(FrozenError, "can't modify a frozen inflection")
      expect { inflector.inflections.human('barbra', 'streisand') }.to raise_error(FrozenError, "can't modify a frozen inflection")
    end
  end

end
