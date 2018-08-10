# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#camelize_upper" do
    Fixtures::CamelizeUpper.cases.each do |input, camelized|
      it "upper camelizes #{input} => #{camelized}" do
        expect(subject.camelize_upper(i(input))).to eq(camelized)
      end
    end

    Fixtures::CamelizeUpper.pending.each do |input, camelized|
      pending "missing exception or rule for #{input} => #{camelized}"
    end

    it "accepts symbols" do
      expect(subject.camelize_upper(:data_mapper)).to eq("DataMapper")
    end

    it "have alias" do
      expect(subject.camelize("camelize_upper")).to eq("CamelizeUpper")
    end
  end
end
