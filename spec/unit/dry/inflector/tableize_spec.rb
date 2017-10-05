# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#tableize" do
    it "pluralizes last word in snake_case strings: fancy_category => fancy_categories" do
      expect(subject.tableize(i("fancy_category"))).to eq("fancy_categories")
    end

    it "underscores CamelCase strings before pluralization: enlarged_testis => enlarged_testes" do
      expect(subject.tableize(i("enlarged_testis"))).to eq("enlarged_testes")
    end

    it "underscores CamelCase strings before pluralization: FancyCategory => fancy_categories" do
      expect(subject.tableize(i("FancyCategory"))).to eq("fancy_categories")
    end

    it "underscores CamelCase strings before pluralization: EnlargedTestis => enlarged_testes" do
      expect(subject.tableize(i("EnlargedTestis"))).to eq("enlarged_testes")
    end

    it "replaces :: with underscores: My::Fancy::Category => my_fancy_categories" do
      expect(subject.tableize(i("My::Fancy::Category"))).to eq("my_fancy_categories")
    end

    it "underscores CamelCase strings before pluralization: Enlarged::Testis => enlarged_testes" do
      expect(subject.tableize(i("Enlarged::Testis"))).to eq("enlarged_testes")
    end
  end
end
