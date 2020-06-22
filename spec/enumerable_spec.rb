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
end
