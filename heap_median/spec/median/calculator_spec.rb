require 'spec_helper'
require 'median/calculator'

describe Median::Calculator do
  describe '#<<' do
    let(:subject) { described_class.new([]) }

    before do
      subject << 1
    end

    it 'adds item to the heap' do
      expect(subject.heap.elements).to eq [1]
    end

    it 'changes median' do
      [2, 4, 3, 5, 10, 7, 8, 9, 6].each do |num|
        subject << num
        puts subject.median
      end
      expect(subject.median).to eq 5.5
    end
  end
end
