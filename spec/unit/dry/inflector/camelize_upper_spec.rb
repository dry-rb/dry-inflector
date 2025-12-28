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

    it "handles acronyms" do
      expect(subject.camelize_upper(i("json"))).to eql("JSON")
      expect(subject.camelize_upper(i("http_error"))).to eql("HTTPError")
      expect(subject.camelize_upper(i("openssl/hmac"))).to eql("OpenSSL::HMAC")
      expect(subject.camelize_upper(i("openssl/digest"))).to eql("OpenSSL::Digest")
    end

    context "custom acronyms" do
      subject do
        Dry::Inflector.new do |inflect|
          inflect.acronym("IP", "HTML", "XML", "BSD", "ÉUA", "4K")
        end
      end

      it "handles acronyms" do
        expect(subject.camelize_upper(i("ip"))).to eql("IP")
        expect(subject.camelize_upper(i("ip_sec"))).to eql("IPSec")
        expect(subject.camelize_upper(i("html_tidy"))).to eql("HTMLTidy")
        expect(subject.camelize_upper(i("html_tidy_generator"))).to eql("HTMLTidyGenerator")
        expect(subject.camelize_upper(i("force_xml_controller"))).to eql("ForceXMLController")
        expect(subject.camelize_upper(i("free_bsd"))).to eql("FreeBSD")
        expect(subject.camelize_upper(i("4k-television"))).to eql("4KTelevision")
      end

      it "handles diacritics" do
        expect(subject.camelize_upper(i("éclair_fest"))).to eql("ÉclairFest")
        expect(subject.camelize_upper(i("éua-trip"))).to eql("ÉUATrip")
        expect(subject.camelize_upper(i("festival_des_éclairs"))).to eql("FestivalDesÉclairs")
        expect(subject.camelize_upper(i("festival_des_4k"))).to eql("FestivalDes4K")
      end
    end
  end
end
