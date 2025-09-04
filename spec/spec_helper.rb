# frozen_string_literal: true

require "bundler/setup"

require_relative "support/coverage"

require "pathname"

SPEC_ROOT = Pathname(__dir__)

require "dry/inflector"

Dir.glob(Pathname.new(__dir__).join("support", "**", "*.rb")).each do |file|
  require_relative file
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.default_formatter = "doc" if config.files_to_run.one?
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end
