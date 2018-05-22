require "benchmark"
require 'benchmark-memory'
require "active_support/all"

GC.disable

require 'fast_try'
FastTry.method_names = [:custom_try]
require 'fast_try/apply'

BENCHMARK_TYPES = ['bm', 'memory']

puts "Results when method is found"

BENCHMARK_TYPES.each do |method|
  Benchmark.send(method) do |x|
    count = 1_000_000
    label_size = 20
    str = 'str'

    x.report "FastTry".rjust(label_size) do
      count.times { str.custom_try('length') }
    end

    x.report "Safe Navigation".rjust(label_size) do
      count.times { str&.length }
    end

    x.report "ActiveSupport try".rjust(label_size) do
      count.times { str.try('length') }
    end

    x.report "Check for nil".rjust(label_size) do
      count.times { str && str.length }
    end

    x.report "respond_to?".rjust(label_size) do
      count.times { str.length if str.respond_to?('length') }
    end

    x.report "rescue".rjust(label_size) do
      count.times { str.length rescue nil }
    end
  end
end

puts "\nResults when method is not found"

BENCHMARK_TYPES.each do |method|
  Benchmark.send(method) do |x|
    count = 1_000_000
    label_size = 20

    x.report "FastTry".rjust(label_size) do
      count.times { nil.custom_try('length') }
    end

    x.report "Safe Navigation".rjust(label_size) do
      count.times { nil&.length }
    end

    x.report "ActiveSupport try".rjust(label_size) do
      count.times { nil.try('length') }
    end

    x.report "Check for nil".rjust(label_size) do
      count.times { nil && nil.length }
    end

    x.report "respond_to?".rjust(label_size) do
      count.times { nil.length if nil.respond_to?('length') }
    end

    x.report "rescue".rjust(label_size) do
      count.times { nil.length rescue nil }
    end
  end
end
