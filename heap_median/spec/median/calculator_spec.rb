require 'spec_helper'
require 'pry'
require 'median/calculator'

def read_examples(input, expected, &block)
  input = IO.readlines(input)[1..-1]
  expected = IO.readlines(expected)
  index = 0
  result = input.each_with_object({}) do |value, acc|
    input_row = value.chomp.strip
    expected_row = expected[input.find_index(value)]
    index += 1
    begin
      yield input_row, expected_row
    rescue Exception
      puts "FAILED at row ##{index}, input: #{input_row}"\
           ", expectd: #{expected_row}"
    end
    acc[input_row] = expected_row
  end
  result
end

describe Median::Calculator do
  let(:subject) { described_class.new([]) }
  describe '#<<' do
    before do
      subject << 1
    end

    it 'adds item to the heap' do
      expect(subject.heap.elements).to eq [1]
    end

    it 'changes median' do
      [2, 4, 3, 5, 10, 7, 8, 9, 6].each do |num|
        subject << num
      end
      expect(subject.median).to eq 5.5
    end
  end
  describe 'works on huge lists' do
    # let(:examples2) { read_examples('./test_input2.txt', './test_output2.txt') }
    it 'works' do
      read_examples('./test_input', './test_output') do |k, v|
        subject << k.to_i
        begin
          expect(subject.median).to eq(v.to_f)
        rescue Exception => e
          puts subject.median
          puts (subject.heap.elements.sort == subject.heap.sorted)
          raise e
        end
      end
      # examples2.each do |k, v|
      #   subject << k.to_i
      #   expect(subject.median).to eq(v.to_f)
      # end
    end
  end
end
