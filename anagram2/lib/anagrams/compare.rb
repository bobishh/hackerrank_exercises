require_relative './word.rb'

module Anagrams
  # compares words and returns result strings
  class Compare
    TRUTH_STRING = 'is an anagram of'.freeze
    LIE_STRING = 'is NOT an anagram of'.freeze
    QUESTION_MARK = '?'.freeze
    SEPARATOR = /\s\?\s/
    QUOTES = '"'.freeze

    def initialize(string)
      @string = string
      @words = string.split(SEPARATOR).map do |w|
        Word.new(w.downcase.gsub(/['"\s]+/, ''))
      end
    end

    def result
      @result ||= readable_result
    end

    private

    def readable_result
      if same?
        @string.sub(/\?/, TRUTH_STRING)
      else
        @string.sub(QUESTION_MARK, LIE_STRING)
      end
    end

    def same?
      diff = @words[0].diff(@words[1])
      diff.reduce(0) do |acc, val|
        acc += val[1] # count summary diff value
        acc
      end == 0 # zero means anagram
    end
  end
end
