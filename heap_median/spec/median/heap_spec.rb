require 'spec_helper'
require 'median/heap'

def index_slice(index)
  from = 2**(index - 1) - 1
  to = 2**index - 1
  (from...to)
end

def print_tree(elements)
  index = 0
  while index < Math.sqrt(elements.size).ceil
    row = elements[index_slice(index)]
    puts row.compact.join ' - ' unless row.nil?
    index += 1
  end
end

describe Median::Heap do
  let(:subject) { described_class.new }
  let(:elements) { elements }

  describe '#<<' do
    context 'existant' do
      before do
        [3, 2, 14].each do |element|
          subject << element
        end
      end
      it 'adds new element to heap' do
        expect { subject << 1 }.to change { subject.elements.include?(1) }.from(false).to(true)
      end
      it 'keeps heap balanced on addition' do
        expect { subject << 1 }.to change { subject.elements[0] }.from(2).to(1)
      end
    end
    it 'keeps heap balanced all the time' do
      ((10..20).to_a.reverse + (0..9).to_a).each do |el|
        subject << el
        expect(subject.elements[0]).to eq(subject.elements.min)
      end
    end
  end

  context 'when not empty' do
    before do
      ((10..20).to_a + (1..9).to_a).each do |number|
        subject << number
      end
    end

    describe 'pop' do
      it 'returns head of heap' do
        elem = subject.pop
        expect(elem).to eq 1
      end
      it 'always returns minimal element of heap' do
        20.times do
          subject.pop
          subject.print_tree
        end
        expect(subject.elements[0]).to eq(subject.elements.min)
      end
    end

    describe '#sorted' do
      it 'returns sorted array of elements', focus: true do
        expect(subject.sorted).to eq((1..20).to_a)
      end
    end
  end
end
