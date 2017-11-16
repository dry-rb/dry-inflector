# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe "#foreign_key" do
    it "adds _id to downcased string: Message => message_id" do
      expect(subject.foreign_key(i("Message"))).to eq "message_id"
    end

    it "demodulizes string first: Admin::Post => post_id" do
      expect(subject.foreign_key(i("Admin::Post"))).to eq "post_id"
    end
  end
end