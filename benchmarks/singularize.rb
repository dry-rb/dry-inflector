require 'benchmark/ips'
require 'dry-inflector'

Benchmark.ips do |x|
  inflector = Dry::Inflector.new
  typical_word = 'users'
  unusual_word = 'oxen'
  x.report("singularize typical word") { inflector.singularize typical_word }
  x.report("singularize unusual word") { inflector.singularize unusual_word }
end
