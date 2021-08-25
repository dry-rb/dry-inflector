# frozen_string_literal: true

module Fixtures
  module CamelizeUpper
    def self.cases
      CASES
    end

    def self.pending
      PENDING
    end

    CASES = {
      "merb" => "Merb",
      "data_mapper" => "DataMapper",
      "data___mapper" => "DataMapper",
      "dry/inflector" => "Dry::Inflector",
      "dry/inflector/inflections" => "Dry::Inflector::Inflections",
      "blog_post/author" => "BlogPost::Author",
      "blog_post/tag_cloud" => "BlogPost::TagCloud"
    }.freeze

    # Missing rules
    PENDING = {}.freeze
  end
end
