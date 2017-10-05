# frozen_string_literal: true

module Dry
  class Inflector
    class Inflections
      # Default inflections
      #
      # @since 0.1.0
      # @api private
      #
      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      module Defaults
        def self.call(inflect)
          plural(inflect)
          singular(inflect)
          irregular(inflect)
          uncountable(inflect)
        end

        def self.plural(inflect)
          inflect.plural(/\z/, "s")
          inflect.plural(/s\z/i, "s")
          inflect.plural(/(ax|test)is\z/i, '\1es')
          inflect.plural(/(octop|vir)us\z/i, '\1i')
          inflect.plural(/(octop|vir)i\z/i, '\1i')
          inflect.plural(/(alias|status)\z/i, '\1es')
          inflect.plural(/(bu)s\z/i, '\1ses')
          inflect.plural(/(buffal|tomat)o\z/i, '\1oes')
          inflect.plural(/([ti])um\z/i, '\1a')
          inflect.plural(/([ti])a\z/i, '\1a')
          inflect.plural(/sis\z/i, "ses")
          inflect.plural(/(?:([^f])fe|([lr])f)\z/i, '\1\2ves')
          inflect.plural(/(hive)\z/i, '\1s')
          inflect.plural(/([^aeiouy]|qu)y\z/i, '\1ies')
          inflect.plural(/(x|ch|ss|sh)\z/i, '\1es')
          inflect.plural(/(matr|vert|ind)(?:ix|ex)\z/i, '\1ices')
          inflect.plural(/([m|l])ouse\z/i, '\1ice')
          inflect.plural(/([m|l])ice\z/i, '\1ice')
          inflect.plural(/^(ox)\z/i, '\1en')
          inflect.plural(/^(oxen)\z/i, '\1')
          inflect.plural(/(quiz)\z/i, '\1zes')
        end

        def self.singular(inflect)
          inflect.singular(/s\z/i, "")
          inflect.singular(/(n)ews\z/i, '\1ews')
          inflect.singular(/([ti])a\z/i, '\1um')
          inflect.singular(/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses\z/i, '\1\2sis')
          inflect.singular(/(^analy)ses\z/i, '\1sis')
          inflect.singular(/([^f])ves\z/i, '\1fe')
          inflect.singular(/(hive)s\z/i, '\1')
          inflect.singular(/(tive)s\z/i, '\1')
          inflect.singular(/([lr])ves\z/i, '\1f')
          inflect.singular(/([^aeiouy]|qu)ies\z/i, '\1y')
          inflect.singular(/(s)eries\z/i, '\1eries')
          inflect.singular(/(m)ovies\z/i, '\1ovie')
          inflect.singular(/(x|ch|ss|sh)es\z/i, '\1')
          inflect.singular(/([m|l])ice\z/i, '\1ouse')
          inflect.singular(/(bus)es\z/i, '\1')
          inflect.singular(/(o)es\z/i, '\1')
          inflect.singular(/(shoe)s\z/i, '\1')
          inflect.singular(/(cris|ax|test)es\z/i, '\1is')
          inflect.singular(/(octop|vir)i\z/i, '\1us')
          inflect.singular(/(alias|status)es\z/i, '\1')
          inflect.singular(/^(ox)en/i, '\1')
          inflect.singular(/(vert|ind)ices\z/i, '\1ex')
          inflect.singular(/(matr)ices\z/i, '\1ix')
          inflect.singular(/(quiz)zes\z/i, '\1')
          inflect.singular(/(database)s\z/i, '\1')
        end

        def self.irregular(inflect)
          inflect.irregular("person", "people")
          inflect.irregular("man", "men")
          inflect.irregular("child", "children")
          inflect.irregular("sex", "sexes")
          inflect.irregular("move", "moves")
          inflect.irregular("cow", "cows")
        end

        def self.uncountable(inflect)
          inflect.uncountable(%w[hovercraft moose milk rain Swiss grass equipment information rice money species series fish sheep jeans])
        end

        private_class_method :plural, :singular, :irregular, :uncountable
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize
    end
  end
end
