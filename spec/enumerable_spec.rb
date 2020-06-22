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

  describe '#my_select' do
    let(:array) { %w[a b c d e f] }

    it 'Selects the even numbers from the original array and returns the selected array' do
      expect([1, 2, 3, 4, 5].my_select(&:even?)).to eql([2, 4])
    end

    it 'Selects an array given a regex expression' do
      expect(array.my_select { |v| v =~ /[aeiou]/ }).to eql(%w[a e])
    end

    it 'returns an enumerable when missing block' do
      expect(array.my_select.class).to eql(Enumerator)
    end
  end

  describe '#my_all?' do
    let(:array) { %w[ant bear cat] }

    it 'My all checks correctly if the word length on all of its items is for a specific size' do
      expect(array.my_all? { |word| word.length >= 3 }).to eql(true)
    end

    it 'My all checks correctly if the word length on all of its items is for a specific size' do
      expect(array.my_all? { |word| word.length >= 5 }).to eql(false)
    end

    it 'All my elements contain a specific character' do
      expect(array.my_all?(/t/)).to eql(false)
    end
  end
end
