# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#constantize" do
    it "constantizes Module" do
      expect(subject.constantize(i("Module"))).to eq Module
    end

    it "constantizes ::Module" do
      expect(subject.constantize(i("::Module"))).to eq Module
    end

    it "constantizes nested constant Dry::Inflector::Inflections" do
      expect(subject.constantize(i("Dry::Inflector::Inflections"))).to eq Dry::Inflector::Inflections
    end

    it "does not search ancestors" do
      module Foo
        class Bar
          VAL = 10
        end

        class Baz < Bar; end
      end

      expect do
        subject.constantize(i("Foo::Baz::VAL"))
      end.to_not raise_error(NameError)
    end

    it "searches in const_missing" do
      module Foo
        class Bar
          def self.const_missing(name)
            name.to_s == "Const" ? Baz : super
          end
        end

        class Baz < Bar; end

        def self.const_missing(name)
          name.to_s == "Autoloaded" ? Bar : super
        end
      end

      expect(subject.constantize(i("Foo::Autoloaded::Const"))).to eq Foo::Baz
      expect(subject.constantize(i("Foo::Bar::Const"))).to eq Foo::Baz
    end

    it "raises exception when empty string given" do
      expect do
        subject.constantize(i(""))
      end.to raise_error(NameError)
    end

    it "raises exception when constant not found" do
      expect do
        subject.constantize(i("Qwerty"))
      end.to raise_error(NameError)
    end
  end
end