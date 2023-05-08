# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#singularize" do
    Fixtures::Singularize.cases.each do |plural, singular|
      it "singularizes #{plural} => #{singular}" do
        expect(subject.singularize(i(plural))).to eq(singular)
      end

      it "singularizes _#{plural} => _#{singular}" do
        expect(subject.singularize(i("_#{plural}"))).to eq("_#{singular}")
      end
    end

    Fixtures::Singularize.pending.each do |plural, singular|
      pending "missing exception or rule for #{plural} => #{singular}"

      it "fails as expected since it's 'pending' (tip: remove it from pending!)" do
        expect(subject.singularize(plural)).to_not eq(singular)
      end
    end

    it "accepts symbols" do
      expect(subject.singularize(:users)).to eq("user")
      expect(subject.singularize(:money)).to eq("money")
    end

    context "with custom inflection rules" do
      subject do
        described_class.new do |inflections|
          inflections.singular    "viruses", "virus"
          inflections.irregular   "plus",    "plusses"
          inflections.uncountable "dry-inflector"
        end
      end

      it "pluralizes using '#singular' rule" do
        expect(subject.singularize("viruses")).to eq("virus")
      end

      it "pluralizes using '#irregular' rule" do
        expect(subject.singularize("plusses")).to eq("plus")
      end

      it "doesn't singularize uncountable" do
        expect(subject.singularize("dry-inflector")).to eq("dry-inflector")
      end
    end
  end
end
