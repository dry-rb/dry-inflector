# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#camelize_lower" do
    Fixtures::CamelizeLower.cases.each do |input, camelized|
      it "lower camelizes #{input} => #{camelized}" do
        expect(subject.camelize_lower(i(input))).to eq(camelized)
      end
    end

    Fixtures::CamelizeLower.pending.each do |input, camelized|
      pending "missing exception or rule for #{input} => #{camelized}"
    end

    it "accepts symbols" do
      expect(subject.camelize_lower(:data_mapper)).to eq("dataMapper")
    end
  end
end
