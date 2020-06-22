require './enumerable_methods'

describe Enumerable do
  describe '#my_each' do
    let(:new_arr) { [] }

    it 'print the values of each element in my array' do
      %w[a b c d e f g].my_each { |i| new_arr << i }
      expect(new_arr).to eql(%w[a b c d e f g])
    end

    it 'returns an enumerable when missing block' do
      expect(new_arr.my_each.class).to eql(Enumerator)
    end
  end

  describe '#my_each_with_index' do
    let(:new_arr) { [] }

    it 'print the values with the index of each element in my array' do
      %w[a b c d e f g].my_each_with_index { |element, index| new_arr << (element + index.to_s) }
      expect(new_arr).to eql(%w[a0 b1 c2 d3 e4 f5 g6])
    end

    it 'returns an enumerable when missing block' do
      expect(new_arr.my_each_with_index.class).to eql(Enumerator)
    end
  end
end
