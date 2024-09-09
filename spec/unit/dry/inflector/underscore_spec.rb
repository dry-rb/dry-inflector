# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#underscore" do
    it "underscores DataMapper as data_mapper" do
      expect(subject.underscore(i("DataMapper"))).to eq("data_mapper")
    end

    it "underscores Merb as merb" do
      expect(subject.underscore(i("Merb"))).to eq("merb")
    end

    it "underscores DataMapper::Resource as data_mapper/resource" do
      expect(subject.underscore(i("DataMapper::Resource"))).to eq("data_mapper/resource")
    end

    it "underscores Merb::BootLoader::Rackup as merb/boot_loader/rackup" do
      expect(subject.underscore(i("Merb::BootLoader::Rackup"))).to eq("merb/boot_loader/rackup")
    end

    it "underscores data-mapper as data_mapper" do
      expect(subject.underscore(i("data-mapper"))).to eq("data_mapper")
    end

    it "underscores CLI as cli" do
      expect(subject.underscore(i("CLI"))).to eq("cli")
    end

    it "underscores castleKing as castle_king" do
      expect(subject.underscore(i("castleKing"))).to eq("castle_king")
    end

    it "underscores CLIRunner as cli_runner" do
      expect(subject.underscore(i("CLIRunner"))).to eq("cli_runner")
    end

    it "underscores aCli as a_cli" do
      expect(subject.underscore(i("aCLI"))).to eq("a_cli")
    end

    it "accepts symbols" do
      expect(subject.underscore(:DataMapper)).to eq("data_mapper")
    end

    it "handles acronyms" do
      expect(subject.underscore(i("JSON"))).to eql("json")
      expect(subject.underscore(i("HTTPError"))).to eql("http_error")
      expect(subject.underscore(i("OpenSSL::HMAC"))).to eql("openssl/hmac")
      expect(subject.underscore(i("OpenSSL::Digest"))).to eql("openssl/digest")
    end

    it "handles diacritics" do
      expect(subject.underscore(i("éclairFest"))).to eql("éclair_fest")
      expect(subject.underscore(i("éuaTrip"))).to eql("éua_trip")
      expect(subject.underscore(i("festival-des-éclairs"))).to eql("festival_des_éclairs")
      expect(subject.underscore(i("ÉBellisimo"))).to eql("é_bellisimo")
      expect(subject.underscore(i("éBellisimo"))).to eql("é_bellisimo")
    end

    it "handles number followed by uppercase letter" do
      expect(subject.underscore(i("9Lives"))).to eql("9_lives")
    end

    pending "handles number followed by lowercase letter" do
      pending "this should be `7_ate_9`"
      expect(subject.underscore(i("7Ate9"))).to eql("7_ate_9")
    end

    it "handles number followed by lowercase letter" do
      pending "this should be 9_lives"
      expect(subject.underscore(i("9lives"))).to eql("9_lives")
    end

    it "handle leading diacritic" do
      expect(subject.underscore(i("éBellisimo"))).to eql("é_bellisimo")
    end

    it "handles leading number " do
      pending "this should be 1_is_one"
      expect(subject.underscore(i("1isOne"))).to eql("1_is_one")
    end

    it "handles leading number with diacritic" do
      pending "this should be 1_é_bellisimo"
      expect(subject.underscore(i("1éBellisimo"))).to eql("1_é_bellisimo")
    end
  end
end
