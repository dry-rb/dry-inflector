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
  end
end
