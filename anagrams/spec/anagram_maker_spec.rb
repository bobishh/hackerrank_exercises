require 'anagram'

describe Anagram do
  # quantity of deletions in string in order to produce an anagram
  let(:file) { IO.readlines('words') }
  let(:first) { IO.readlines('word1')[0].chomp } # file[0] }
  let(:second) { IO.readlines('word2')[0].chomp } # file[1] }

  it 'returns deletion count' do
    expect(described_class.deletions('abc', 'cde')).to eq 4
  end

  it 'triangulate ...' do
    expect(described_class.deletions('abracadabra', 'arcdeb')).to eq 7
  end

  it 'triangulate ...' do
    expect(described_class.deletions('girl', 'boy')).to eq 7
  end

  it 'triangulates' do
    expect(described_class.deletions(first, second)).to eq 712
  end
end
