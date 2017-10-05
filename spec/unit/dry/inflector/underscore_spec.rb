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
  end
end
