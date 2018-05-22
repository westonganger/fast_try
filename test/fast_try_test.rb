#!/usr/bin/env ruby -w

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'yaml'
require 'minitest'

require 'fast_try'
require 'fast_try/apply'

require 'minitest/autorun'

class TestRearmed < MiniTest::Test
  def setup
  end

  def test_defaults
    assert_nil nil.try('foo')
  end

  def test_custom_method_names
  end

  def test_overwrite_active_support
  end

  def test_generic_object_types
  end

  def test_already_applied_errors
  end

  def test_methods_only_accepts_arrays
  end

  def teardown
  end
end
