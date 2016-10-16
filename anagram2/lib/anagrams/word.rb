module Anagrams
  # states as a word
  class Word
    extend Forwardable
    attr_reader :hash
    def_delegators :@hash, :keys

    def initialize(string)
      @initial = string
      process(string)
    end

    def [](symbol)
      return @hash[symbol] if @hash[symbol].is_a?(Fixnum)
      0
    end

    def diff(word)
      Hash[(self.keys + word.keys).map do |k|
             [k, (self[k] - word[k]).abs]
           end]
    end

    private

    def process(string)
      @hash ||= {}
      string.split('').map do |symbol|
        @hash[symbol] ||= 0
        @hash[symbol] += 1
      end
    end
  end
end
