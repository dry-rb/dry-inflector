# frozen_string_literal: true

module RSpec
  module Support
    module Immutable
      private

      def i(string)
        string.freeze
      end
    end
  end
end

RSpec.configure do |config|
  config.include RSpec::Support::Immutable
end
