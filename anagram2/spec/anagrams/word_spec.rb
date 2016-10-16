require 'spec_helper'
require 'anagrams/word'

# states as a word
describe Anagrams::Word do
  let(:word1) { 'anagram' }
  let(:word2) { 'bubblegum' }
  let(:subject) { described_class.new(word1) }
  let(:object) { described_class.new(word2) }
  let(:expected) do
    { 'a' => 3, 'g' => 0, 'm' => 0,
      'n' => 1, 'r' => 1, 'b' => 3,
      'u' => 2, 'l' => 1, 'e' => 1 }
  end

  describe '#diff' do
    context 'returns hash with letters diff' do
      it 'returns correct values' do
        expect(subject.diff(object)).to eq expected
      end
    end
  end
end
