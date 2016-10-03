# counts deletions of letters to mek one word anagram of another
require_relative './anagram/word'

# module for counting deletions to make one word anagram
# of another
module Anagram
  class << self
    def deletions(a, b)
      a = Word.new(a)
      b = Word.new(b)
      a.diff(b).map { |_k, v| v }.reduce(&:+)
    end
  end
end
