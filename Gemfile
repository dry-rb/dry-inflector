# frozen_string_literal: true

source "https://rubygems.org"
gemspec

unless ENV["TRAVIS"]
  gem "byebug", require: false, platforms: :mri if RUBY_VERSION >= "2.3.0"
  gem "yard",   require: false
end
