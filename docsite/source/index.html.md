---
title: Introduction
description: Standalone inflections
layout: gem-single
order: 18
type: gem
name: dry-inflector
---

dry-inflector is an inflector gem for Ruby, which provides a configurable inflector **object**, rather than using a singleton.

### Basic usage

``` ruby
require "dry/inflector"

inflector = Dry::Inflector.new

inflector.pluralize("book")    # => "books"
inflector.singularize("books") # => "book"

inflector.camelize("dry/inflector") # => "Dry::Inflector"
inflector.classify("books")         # => "Book"
inflector.tableize("Book")          # => "books"

inflector.dasherize("dry_inflector")  # => "dry-inflector"
inflector.underscore("dry-inflector") # => "dry_inflector"

inflector.demodulize("Dry::Inflector") # => "Inflector"

inflector.humanize("dry_inflector")    # => "Dry inflector"
inflector.humanize("author_id")        # => "Author"

inflector.ordinalize(1)  # => "1st"
inflector.ordinalize(2)  # => "2nd"
inflector.ordinalize(3)  # => "3rd"
inflector.ordinalize(10) # => "10th"
inflector.ordinalize(23) # => "23rd"
```

### Custom inflection rules

``` ruby
require "dry/inflector"

inflector = Dry::Inflector.new do |inflections|
  inflections.plural      "virus",   "viruses" # specify a rule for #pluralize
  inflections.singular    "thieves", "thief"   # specify a rule for #singularize
  inflections.uncountable "dry-inflector"      # add an exception for an uncountable word
end

inflector.pluralize("virus")     # => "viruses"
inflector.singularize("thieves") # => "thief"

inflector.pluralize("dry-inflector") # => "dry-inflector"
```

### Acronyms

```ruby
require "dry/inflector"

inflector = Dry::Inflector.new do |inflections|
  inflections.acronym "HTTP", "XML"
end

inflector.underscore("XMLHTTPRequest") # => "xml_http_request"
inflector.camelize("xml_http_request") # => "XMLHTTPRequest"
```
