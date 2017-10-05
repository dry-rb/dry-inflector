# frozen_string_literal: true

module Dry
  class Inflector
    # A set of inflection rules
    #
    # @since 0.1.0
    #
    # FIXME: this should be a subclass
    class Rules < Array
      def apply_to(word)
        result = word.dup
        each { |rule, replacement| break if result.gsub!(rule, replacement) }
        result
      end
    end
  end
end
