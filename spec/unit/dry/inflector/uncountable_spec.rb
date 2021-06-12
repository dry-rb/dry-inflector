# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#uncountable?" do
    it "returns true when empty string" do
      expect(subject.uncountable?(i(""))).to be(true)
    end

    it "returns true when blank string" do
      expect(subject.uncountable?(i("   "))).to be(true)
    end

    it "returns true when word is present in list" do
      expect(subject.uncountable?(i("grass"))).to be(true)
    end

    it "returns false when word is not present in list" do
      expect(subject.uncountable?(i("user"))).to be(false)
    end

    it "returns true when word is present in list but in different case" do
      expect(subject.uncountable?(i("FiSH"))).to be(true)
    end
  end
end
