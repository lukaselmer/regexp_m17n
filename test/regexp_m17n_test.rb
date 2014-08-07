# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string_without_dummy_encodings
    Encoding.list.reject(&:dummy?).each do |enc|
      assert(RegexpM17N.non_empty?('.'.encode(enc)))
    end
  end

  def test_non_empty_string_with_dummy_encodings
    Encoding.list.select(&:dummy?).each do |enc|
      assert(RegexpM17N.non_empty?('.'.force_encoding(enc)))
    end
  end
end
