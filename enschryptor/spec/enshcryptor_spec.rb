require 'spec_helper'
require 'enshcryptor'

describe Enshcryptor do
  let(:input1) { 'if man was meant to stay on the ground god would have given us roots' }
  let(:result1) do
    'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau'
  end
  let(:input2) { 'chillout' }
  let(:result2) { 'clu hlt io' }

  let(:input3) { 'iou' }
  let(:result3) { 'iu o' }

  it 'encrypts as expected' do
    expect(described_class.new(input1).encrypted).to eq result1
    expect(described_class.new(input3).encrypted).to eq result3
    expect(described_class.new(input2).encrypted).to eq result2
  end
end
