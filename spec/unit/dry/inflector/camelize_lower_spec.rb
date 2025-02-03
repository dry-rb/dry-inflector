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

    it "handles acronyms" do
      expect(subject.camelize_lower(i("json"))).to eql("JSON")
      expect(subject.camelize_lower(i("http_error"))).to eql("HTTPError")
      expect(subject.camelize_lower(i("openssl/hmac"))).to eql("OpenSSL::HMAC")
      expect(subject.camelize_lower(i("openssl/digest"))).to eql("OpenSSL::Digest")
    end

    context "custom acronyms" do
      subject do
        Dry::Inflector.new do |inflect|
          inflect.acronym("IP", "HTML", "XML", "BSD", "ÉUA", "4K")
        end
      end

      it "handles acronyms" do
        expect(subject.camelize_lower(i("ip"))).to eql("IP")
        expect(subject.camelize_lower(i("ip_sec"))).to eql("IPSec")
        expect(subject.camelize_lower(i("html_tidy"))).to eql("HTMLTidy")
        expect(subject.camelize_lower(i("html_tidy_generator"))).to eql("HTMLTidyGenerator")
        expect(subject.camelize_lower(i("force_xml_controller"))).to eql("forceXMLController")
        expect(subject.camelize_lower(i("free_bsd"))).to eql("freeBSD")
      end

      it "handles diacritics" do
        expect(subject.camelize_lower(i("éclair_fest"))).to eql("éclairFest")
        expect(subject.camelize_lower(i("éua-trip"))).to eql("ÉUATrip")
        expect(subject.camelize_lower(i("festival_des_éclairs"))).to eql("festivalDesÉclairs")
        expect(subject.camelize_lower(i("festival_des_4k"))).to eql("festivalDes4K")
      end
    end
  end
end
