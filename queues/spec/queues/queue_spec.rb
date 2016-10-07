require 'spec_helper'
require 'queues/queue'

describe Queues::Queue do
  let(:subject) { described_class.new }
  describe '#enqueue' do
    it 'returns true when enqueued' do
      expect(subject.enqueue 42).to eq true
    end
  end

  describe '#head' do
    before do
      subject.enqueue 42
    end

    it 'returns last element enqueued' do
      expect(subject.head).to eq 42
    end
  end
end
