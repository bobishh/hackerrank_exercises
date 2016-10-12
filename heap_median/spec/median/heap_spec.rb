require 'spec_helper'
require 'median/heap'

describe Median::Heap do
  let(:subject) { described_class.new }
  let(:elements) { elements }

  describe '#<<' do
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

  context 'when not empty' do
    before do
      ((10..20).to_a + (1..9).to_a).each do |number|
        subject << number
      end
    end

    describe 'poll' do
      it 'returns head of heap' do
        elem = subject.poll
        expect(elem).to eq 1
      end
    end

    describe '#sorted' do
      it 'returns sorted array of elements', focus: true do
        expect(subject.sorted).to eq((1..20).to_a)
      end
    end
  end
end
