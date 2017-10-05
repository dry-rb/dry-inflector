# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#singularize" do
    Fixtures::Singularize.cases.each do |plural, singular|
      it "pluralizes #{singular} => #{plural}" do
        expect(subject.singularize(i(plural))).to eq(singular)
      end
    end

    Fixtures::Singularize.pending.each do |plural, singular|
      pending "missing exception or rule for #{plural} => #{singular}"
    end
  end
end
