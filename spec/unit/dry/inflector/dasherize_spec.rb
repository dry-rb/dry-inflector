# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#dasherize" do
    it "dasherizes data_mapper_rspec as data-mapper-rspec" do
      expect(subject.dasherize(i("data_mapper_rspec"))).to eq("data-mapper-rspec")
    end
  end
end
