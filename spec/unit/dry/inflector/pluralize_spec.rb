# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#pluralize" do
    Fixtures::Pluralize.cases.each do |singular, plural|
      it "pluralizes #{singular} => #{plural}" do
        expect(subject.pluralize(i(singular))).to eq(plural)
      end
    end

    Fixtures::Pluralize.irregular.each do |singular, plural|
      it "(irregular) pluralizes#{singular} => #{plural}" do
        expect(subject.pluralize(i(singular))).to eq(plural)
      end
    end

    Fixtures::Pluralize.pending.each do |singular, plural|
      pending "missing exception or rule for #{singular} => #{plural}"

      it "fails as expected since it's 'pending' (tip: remove it from pending!)" do
        expect(subject.singularize(singular)).to_not eq(plural)
      end
    end

    it "accepts symbols" do
      expect(subject.pluralize(:user)).to eq("users")
      expect(subject.pluralize(:money)).to eq("money")
    end

    context "with custom inflection rules" do
      subject do
        described_class.new do |inflections|
          inflections.plural      "virus",   "viruses"
          inflections.irregular   "plus",    "plusses"
          inflections.uncountable "dry-inflector"
        end
      end

      it "pluralizes using '#plural' rule" do
        expect(subject.pluralize("virus")).to eq("viruses")
      end

      it "pluralizes using '#irregular' rule" do
        expect(subject.pluralize("plus")).to eq("plusses")
      end

      it "doesn't pluralize uncountable" do
        expect(subject.pluralize("dry-inflector")).to eq("dry-inflector")
      end
    end
  end
end
