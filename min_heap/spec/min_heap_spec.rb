require 'spec_helper'
require 'min_heap'

describe MinHeap do
  let(:subject) { described_class.new }
  # PRIVATE METHODS BELOW
  # describe '#swap' do
  #   before do
  #     subject << 1
  #     subject << 2
  #   end
  #   it 'swaps values in array' do
  #     expect { subject.swap(0, -1)}.to change {subject.elements }.from([1, 2]).to([2,1])
  #   end
  # end

  # describe '#left_node' do
  #   it 'returns left node index' do
  #     expect(subject.left_node(1)).to eq(3)
  #     expect(subject.left_node(5)).to eq(11)
  #   end
  # end

  # describe '#right_node' do
  #   it 'returns left node index' do
  #     expect(subject.right_node(1)).to eq(4)
  #     expect(subject.right_node(5)).to eq(12)
  #   end
  # end

  # describe '#parent_node' do
  #   it 'returns parent node index' do
  #     expect(subject.parent_node(3)).to eq(1)
  #     expect(subject.parent_node(4)).to eq(1)
  #     expect(subject.parent_node(5)).to eq(2)
  #     expect(subject.parent_node(2)).to eq(0)
  #   end
  # end

  # describe '#node_value' do
  #   before do
  #     [1, 2, 3].each do |n|
  #       subject << n
  #     end
  #   end
  #   it 'returns value of node with index' do
  #     subject.print_tree
  #     expect(subject.node_value(0)).to eq 1
  #     expect(subject.node_value(0, :left)).to eq 2
  #     expect(subject.node_value(0, :right)).to eq 3
  #   end
  # end

  describe '#<<' do
    it 'keeps head minimal' do
      (20..131).each do |n|
        subject << n
        subject.print_tree
        puts subject.elements.inspect
        expect(subject.elements[0]).to eq(subject.elements.min)
      end
    end
  end
  describe '#pop' do
    before do
      ((10..20).to_a + (0..9).to_a).each do |num|
        subject << num
      end
    end

    it 'always returns minimal' do
      20.times do
        minimal = subject.elements.min
        expect(subject.pop).to eq(minimal)
      end
    end
  end

  describe '#sorted' do
    before do
      ((10..20).to_a + (0..9).to_a).each do |num|
        subject << num
      end
    end
    it 'returns sorted array' do
      expect(subject.sorted).to eq((0..20).to_a)
    end
  end

  describe 'from array' do
    let(:subject) { described_class.new([11, 2, 31, 4, 14, 15, 53]) }
    describe '#pop' do
      it 'always returns minimal' do
        7.times do
          minimal = subject.elements.min
          expect(subject.pop).to eq(minimal)
        end
      end
    end
  end

  describe '.new' do
    context 'without args' do
      let(:subject) { described_class.new }

      it 'returns min_heap' do
        expect(subject).to be_kind_of described_class
      end
    end
  end
end
