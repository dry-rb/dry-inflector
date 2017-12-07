# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#humanize" do
    it "replaces _ with space: humanizes employee_salary as Employee salary" do
      expect(subject.humanize(i("employee_salary"))).to eq("Employee salary")
    end

    it "strips _id endings: humanizes author_id as Author" do
      expect(subject.humanize(i("author_id"))).to eq("Author")
    end

    it "uses user added rules when possible" do
      subject = described_class.new do |inflect|
        inflect.human("Question", "Fancy question")
        inflect.human("questionary", "Questionnaire")
      end

      expect(subject.humanize(i("questionary"))).to eq("Questionnaire")
    end

    it "accepts symbols" do
      expect(subject.humanize(:employee_salary)).to eq("Employee salary")
    end

    it "handle acronyms" do
      expect(subject.humanize(i("json"))).to eql("JSON")
      expect(subject.humanize(i("http_error"))).to eql("HTTP Error")
      expect(subject.humanize(i("openssl/hmac"))).to eql("OpenSSL/HMAC")
      expect(subject.humanize(i("openssl/digest"))).to eql("OpenSSL/Digest")
    end
  end
end
