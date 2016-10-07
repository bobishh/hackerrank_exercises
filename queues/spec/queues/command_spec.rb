require 'spec_helper'
require 'queues/command.rb'
require 'queues/queue.rb'

describe Queues::Command do
  let(:queue) { instance_double(Queues::Queue) }
  let(:command) { '1 10' }
  let(:subject) { described_class.new(command, queue) }

  describe '#new' do
    it 'returns instance which responds to #run' do
      expect(subject).to respond_to :run
    end
  end

  describe '#run' do
    before do
      allow(queue).to receive(:enqueue).and_return(true)
    end

    it 'dispatches methods to queue' do
      subject.run
      expect(queue).to have_received(:enqueue)
    end
  end
end
