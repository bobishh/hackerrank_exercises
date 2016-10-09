require 'spec_helper'
require 'median/heap'

describe Median::Heap do
  let(:subject) { described_class.new }

  describe '#<<' do
    it 'adds new element to heap' do
      expect { subject << 1 }.to change { subject.elements }.from([]).to([1])
    end
  end

  context 'when not empty' do
    before do
      (1..20).each do |number|
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
        expect(subject.elements).to eq((1..20).to_a)
      end
    end
  end
end
