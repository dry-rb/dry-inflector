## 0.2.1 (unreleased)


### Fixed

- [Luca Guidi] Fixed `Dry::Inflector#constantize` to not inherit constants from siblings namespaces
- ```ruby
- module Foo
-   module Bar
-     VERSION = "0.1.0"
-   end
-
-   module Baz
-   end
- end
-
- module Test
- end
-
- module Check
- end
-
- inflector = Dry::Inflector.new
-
- # BEFORE
- inflector.constantize("Foo::Baz::VERSION") # => VERSION
- inflector.constantize("Test::Check") # => Check
-
- # AFTER
- inflector.constantize("Foo::Baz::VERSION") # => raises NameError
- inflector.constantize("Test::Check") # => raises NameError
- ```

## 0.2.0 2019-10-13


### Added

- [Abinoam P. Marques Jr. & Andrii Savchenko] Introduced `Dry::Inflector#camelize_upper` and `Dry::Inflector#camelize_lower`. `Dry::Inflector#camelize` is now an alias for `Dry::Inflector#camelize_upper`.
- ```ruby
- inflector.camelize_upper("data_mapper") # => "DataMapper"
- inflector.camelize_lower("data_mapper") # => "dataMapper"
- ```

### Fixed

- [ecnal] Fixed singularization rules for words like "alias" or "status"


[Compare v0.1.2...v0.2.0](https://github.com/dry-rb/dry-inflector/compare/v0.1.2...v0.2.0)

## 0.1.2 2018-04-25


### Added

- [Gustavo Caso & Nikita Shilnikov] Added support for acronyms


[Compare v0.1.1...v0.1.2](https://github.com/dry-rb/dry-inflector/compare/v0.1.1...v0.1.2)

## 0.1.1 2017-11-18


### Fixed

- [Luca Guidi & Abinoam P. Marques Jr.] Ensure `Dry::Inflector#ordinalize` to work for all the numbers from 0 to 100


[Compare v0.1.0...v0.1.1](https://github.com/dry-rb/dry-inflector/compare/v0.1.0...v0.1.1)

## 0.1.0 2017-11-17


### Added

- [Luca Guidi] Introduced `Dry::Inflector#pluralize`
- [Luca Guidi] Introduced `Dry::Inflector#singularize`
- [Luca Guidi] Introduced `Dry::Inflector#camelize`
- [Luca Guidi] Introduced `Dry::Inflector#classify`
- [Luca Guidi] Introduced `Dry::Inflector#tableize`
- [Luca Guidi] Introduced `Dry::Inflector#dasherize`
- [Luca Guidi] Introduced `Dry::Inflector#underscore`
- [Luca Guidi] Introduced `Dry::Inflector#demodulize`
- [Luca Guidi] Introduced `Dry::Inflector#humanize`
- [Luca Guidi] Introduced `Dry::Inflector#ordinalize`
- [Abinoam P. Marques Jr.] Introduced `Dry::Inflector#foreign_key`
- [Abinoam P. Marques Jr.] Introduced `Dry::Inflector#constantize`
