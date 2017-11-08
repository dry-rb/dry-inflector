# frozen_string_literal: true

require "set"

module Dry
  # dry-inflector
  #
  # @since 0.1.0
  class Inflector
    require "dry/inflector/version"
    require "dry/inflector/inflections"

    # Instantiate the inflector
    #
    # @param blk [Proc] an optional block to specify custom inflection rules
    # @yieldparam [Dry::Inflector::Inflections] the inflection rules
    #
    # @return [Dry::Inflector] the inflector
    #
    # @since 0.1.0
    #
    # @example Basic usage
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #
    # @example Custom inflection rules
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new do |inflections|
    #     inflections.plural      "virus",   "viruses" # specify a rule for #pluralize
    #     inflections.singular    "thieves", "thief"   # specify a rule for #singularize
    #     inflections.uncountable "dry-inflector"      # add an exception for an uncountable word
    #   end
    def initialize(&blk)
      @inflections = Inflections.build(&blk)
    end

    # Camelize a string
    #
    # @param input [String] the input
    # @return [String] the camelized string
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.camelize("dry/inflector") # => "Dry::Inflector"
    def camelize(input)
      input.gsub(/\/(.?)/) { "::#{Regexp.last_match(1).upcase}" }.gsub(/(?:\A|_)(.)/) { Regexp.last_match(1).upcase }
    end

    # Classify a string
    #
    # @param input [String] the input
    # @return [String] the classified string
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.classify("books") # => "Book"
    def classify(input)
      camelize(singularize(input.sub(/.*\./, "")))
    end

    # Dasherize a string
    #
    # @param input [String] the input
    # @return [String] the dasherized string
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.dasherize("dry_inflector") # => "dry-inflector"
    def dasherize(input)
      input.tr("_", "-")
    end

    # Demodulize a string
    #
    # @param input [String] the input
    # @return [String] the demodulized string
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.demodulize("Dry::Inflector") # => "Inflector"
    def demodulize(input)
      input.split("::").last
    end

    # Humanize a string
    #
    # @param input [String] the input
    # @return [String] the humanized string
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.humanize("dry_inflector") # => "Dry inflector"
    #   inflector.humanize("author_id")     # => "Author"
    def humanize(input)
      result = inflections.humans.apply_to(input)
      result.gsub!(/_id\z/, "")
      result.tr!("_", " ")
      result.capitalize!
      result
    end

    # Ordinalize a number
    #
    # @param number [Integer] the input
    # @return [String] the ordinalized number
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.ordinalize(1)  # => "1st"
    #   inflector.ordinalize(2)  # => "2nd"
    #   inflector.ordinalize(3)  # => "3rd"
    #   inflector.ordinalize(10) # => "10th"
    #   inflector.ordinalize(23) # => "23rd"
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

    # Pluralize a string
    #
    # @param input [String] the input
    # @return [String] the pluralized string
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.pluralize("book")  # => "books"
    #   inflector.pluralize("money") # => "money"
    def pluralize(input)
      return input if uncountable?(input)
      inflections.plurals.apply_to(input)
    end

    # Singularize a string
    #
    # @param input [String] the input
    # @return [String] the singularized string
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.singularize("books") # => "book"
    #   inflector.singularize("money") # => "money"
    def singularize(input)
      return input if uncountable?(input)
      inflections.singulars.apply_to(input)
    end

    # Tableize a string
    #
    # @param input [String] the input
    # @return [String] the tableized string
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.tableize("Book") # => "books"
    def tableize(input)
      input = input.gsub(/::/, "_")
      pluralize(underscorize(input))
    end

    # Underscore a string
    #
    # @param input [String] the input
    # @return [String] the underscored string
    #
    # @since 0.1.0
    #
    # @example
    #   require "dry/inflector"
    #
    #   inflector = Dry::Inflector.new
    #   inflector.underscore("dry-inflector") # => "dry_inflector"
    def underscore(input)
      input = input.gsub(/::/, "/")
      underscorize(input)
    end

    # Check if the input is an uncountable word
    #
    # @param input [String] the input
    # @return [TrueClass,FalseClass] the result of the check
    #
    # @since 0.1.0
    # @api private
    def uncountable?(input)
      !(input =~ /\A[[:space:]]*\z/).nil? || inflections.uncountables.include?(input.downcase)
    end

    private

    # @since 0.1.0
    # @api private
    ORDINALIZE_TH = (4..16).to_set.freeze

    # @since 0.1.0
    # @api private
    attr_reader :inflections

    # @since 0.1.0
    # @api private
    def underscorize(input)
      input.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      input.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
      input.tr!("-", "_")
      input.downcase!
      input
    end
  end
end
