# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#camelize" do
    it "camelizes data_mapper as DataMapper" do
      expect(subject.camelize(i("data_mapper"))).to eq("DataMapper")
    end

    it "camelizes merb as Merb" do
      expect(subject.camelize(i("merb"))).to eq("Merb")
    end

    it "camelizes data_mapper/resource as DataMapper::Resource" do
      expect(subject.camelize(i("data_mapper/resource"))).to eq("DataMapper::Resource")
    end

    it "camelizes data_mapper/associations/one_to_many as DataMapper::Associations::OneToMany" do
      expect(subject.camelize(i("data_mapper/associations/one_to_many"))).to eq("DataMapper::Associations::OneToMany")
    end

    it "accepts symbols" do
      expect(subject.camelize(:data_mapper)).to eq("DataMapper")
    end

    it "handle acronyms" do
      expect(subject.camelize(i("json"))).to eql("JSON")
      expect(subject.camelize(i("http_error"))).to eql("HTTPError")
      expect(subject.camelize(i("openssl/hmac"))).to eql("OpenSSL::HMAC")
      expect(subject.camelize(i("openssl/digest"))).to eql("OpenSSL::Digest")
    end
  end
end
