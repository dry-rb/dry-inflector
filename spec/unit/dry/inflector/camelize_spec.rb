# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#camelize" do
    describe %("first_name") do
      it { expect(subject.camelize(i("first_name"))).to eq("FirstName") }
    end

    describe %("first_name", false) do
      it { expect(subject.camelize(i("first_name"), false)).to eq("firstName") }
    end

    describe %("first_name", true) do
      it { expect(subject.camelize(i("first_name"), true)).to eq("FirstName") }
    end

    describe %("first_name", upper: false) do
      it { expect(subject.camelize(i("first_name"), upper: false)).to eq("firstName") }
    end

    describe %("first_name", upper: true) do
      it { expect(subject.camelize(i("first_name"), upper: true)).to eq("FirstName") }
    end

    describe %("first_name", lower: false) do
      it { expect(subject.camelize(i("first_name"), lower: false)).to eq("FirstName") }
    end

    describe %("first_name", lower: true) do
      it { expect(subject.camelize(i("first_name"), lower: true)).to eq("firstName") }
    end
  end
end
