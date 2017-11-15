# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#pluralize" do
    Fixtures::Pluralize.cases.each do |singular, plural|
      it "pluralizes #{singular} => #{plural}" do
        expect(subject.pluralize(i(singular))).to eq(plural)
      end
    end

    Fixtures::Pluralize.pending.each do |singular, plural|
      pending "missing exception or rule for #{singular} => #{plural}"
    end

    it "accepts symbols" do
      expect(subject.pluralize(:user)).to eq("users")
      expect(subject.pluralize(:money)).to eq("money")
    end
  end
end
