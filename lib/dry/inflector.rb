# frozen_string_literal: true

require "set"

module Dry
  # dry-inflector
  #
  # @since 0.1.0
  class Inflector
    require "dry/inflector/version"
    require "dry/inflector/inflections"

    def initialize(&blk)
      @inflections = Inflections.build(&blk)
    end

    def camelize(input)
      input.gsub(/\/(.?)/) { "::#{Regexp.last_match(1).upcase}" }.gsub(/(?:\A|_)(.)/) { Regexp.last_match(1).upcase }
    end

    def dasherize(input)
      input.tr("_", "-")
    end

    def demodulize(input)
      input.split("::").last
    end

    def humanize(input)
      result = inflections.humans.apply_to(input)
      result.gsub!(/_id\z/, "")
      result.tr!("_", " ")
      result.capitalize!
      result
    end

    def ordinalize(number)
      abs_value = number.abs

      if ORDINALIZE_TH.include?(abs_value % 100)
        "#{number}th"
      else
        case abs_value % 10
        when 1 then "#{number}st"
        when 2 then "#{number}nd"
        when 3 then "#{number}rd"
        end
      end
    end

    def pluralize(word)
      return word if uncountable?(word)
      inflections.plurals.apply_to(word)
    end

    def singularize(word)
      return word if uncountable?(word)
      inflections.singulars.apply_to(word)
    end

    def underscore(input)
      word = input.gsub(/::/, "/")
      underscorize(word)
    end

    def uncountable?(word)
      word.empty? || inflections.uncountables.include?(word.downcase)
    end

    private

    ORDINALIZE_TH = (4..16).to_set.freeze

    attr_reader :inflections

    def underscorize(word)
      word.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word
    end
  end
end
