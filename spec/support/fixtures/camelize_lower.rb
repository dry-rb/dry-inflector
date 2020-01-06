# frozen_string_literal: true

module Fixtures
  module CamelizeLower
    def self.cases
      CASES
    end

    def self.pending
      PENDING
    end

    CASES = {
      "merb" => "merb",
      "data_mapper" => "dataMapper",
      "dry/inflector" => "dry::Inflector",
      "dry/inflector/inflections" => "dry::Inflector::Inflections",
      "blog_post/author" => "blogPost::Author",
      "blog_post/tag_cloud" => "blogPost::TagCloud"
    }.freeze

    # Missing rules
    PENDING = {}.freeze
  end
end
