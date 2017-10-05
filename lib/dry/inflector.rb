# frozen_string_literal: true

module Dry
  # dry-inflector
  #
  # @since 0.1.0
  class Inflector
    require "dry/inflector/version"
    require "dry/inflector/inflections"

    def initialize
      @inflections = Inflections.build
    end

    def camelize(input)
      input.gsub(/\/(.?)/) { "::#{Regexp.last_match(1).upcase}" }.gsub(/(?:\A|_)(.)/) { Regexp.last_match(1).upcase }
    end

    def pluralize(word)
      return word if uncountable?(word)
      inflections.plurals.apply_to(word)
    end

    def singularize(word)
      return word if uncountable?(word)
      inflections.singulars.apply_to(word)
    end

    def uncountable?(word)
      word.empty? || inflections.uncountables.include?(word.downcase)
    end

    private

    attr_reader :inflections
  end
end
