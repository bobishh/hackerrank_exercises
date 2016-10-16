require 'spec_helper'
require 'anagrams/compare.rb'

def read_examples
  input = IO.readlines('./input.txt')
  expected = IO.readlines('./expected.txt')
  input.each_with_object({}) do |value, acc|
    acc[value] = expected[input.find_index(value)]
  end
end

describe Anagrams::Compare do
  let(:examples) { read_examples }
  it 'works' do
    examples.each do |k, v|
      expect(described_class.new(k).result).to eq(v)
    end
  end
end
