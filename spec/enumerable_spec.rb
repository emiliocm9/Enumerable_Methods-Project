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

    it 'Evaluate my all without any block given' do
      expect([].my_all?).to eql(true)
    end

    it 'Evaluates my all with a class as a parameter' do
      expect(array.my_all?(String)).to eql(true)
    end
  end

  describe '#my_any?' do
    let(:array) { %w[ant bear cat] }

    it 'My any will check if any of the items inside an array comply with the conditions' do
      expect(array.my_any? { |i| i.length >= 3 }).to eql(true)
    end

    it 'My any will check if any of the items inside an array comply with the conditions' do
      expect(array.my_any? { |word| word.length >= 5 }).to eql(false)
    end

    it 'Any of my elements contain a specific character' do
      expect(array.my_any?(/t/)).to eql(true)
    end

    it 'Evaluate my any without any block given' do
      expect([].my_any?).to eql(false)
    end

    it 'Evaluates my any with a class as a parameter' do
      expect(array.my_any?(String)).to eql(true)
    end
  end

  describe '#my_none?' do
    let(:array) { %w[ant bear cat] }

    it 'My none will check if none of the items inside an array comply with the condition' do
      expect(array.my_none? { |word| word.length == 5 }).to eql(true)
    end

    it 'My none will check if none of the items inside an array comply with the conditions' do
      expect(array.my_none? { |word| word.length >= 5 }).to eql(true)
    end

    it 'None of my elements contain a specific character' do
      expect(array.my_none?(/t/)).to eql(false)
    end

    it 'Evaluate my none without any block given' do
      expect([].my_none?).to eql(true)
    end

    it 'Evaluates my none with a class as a parameter' do
      expect(array.my_none?(String)).to eql(false)
    end
  end

  describe '#my_count' do
    let(:array) { %w[9 2 5 2 9 2 1].map(&:to_i) }

    it 'My count will return the length of my array if a parameter is not given' do
      expect(array.my_count).to eql(array.length)
    end

    it 'My count will return the number of items that are equal to the parameter given' do
      expect(array.my_count(2)).to eql(3)
    end

    it 'My count will return the number of items that comply with the condition given inside a block' do
      expect(array.my_count { |number| number % 3 == 0 }).to eql(2)
    end
  end

  describe '#my_map' do
    let(:array) { %w[count bear cat fish lion] }
    let(:range) { (1..4).to_a }
    let(:numbers) { %w[1 5 8 7 9 6 5 2 3] }

    it 'My map will return a new array with the results of the conditions given inside a block applied on every item' do
      expect(range.my_map { |number| number * number }).to eql([1, 4, 9, 16])
    end

    it 'My map will return the concat result of the conditions given inside the block applied on each item' do
      expect(array.my_map { |word| word + 'item' }).to eql(%w[countitem bearitem catitem fishitem lionitem])
    end

    it 'My map will return a new array with the results of the conditions given in the parameter applied on every item' do
      expect(numbers.my_map(&:to_i)).to eql([1, 5, 8, 7, 9, 6, 5, 2, 3])
    end

    it 'returns an enumerator when missing block' do
      expect(range.my_map.class).to eql(Enumerator)
    end
  end

  describe '#my_inject' do
    let(:array) { %w[cat sheep bear] }
    let(:range) { (5..10).to_a }

    it 'My inject will add numbers from 5 to 10 properly to the returned variable using a symbol as parameter' do
      expect(range.my_inject(:+)).to eql(45)
    end

    it 'My inject will add numbers from 5 to 10 properly to the returned variables using a block' do
      expect(range.my_inject { |sum, n| sum + n }).to eql(45)
    end

    it 'My inject will multiply numbers given a starting accumulator value' do
      expect(range.inject(1) { |product, n| product * n }).to eql(151_200)
    end

    it 'My inject will return the longest word in my array' do
      longest = array.my_inject do |memo, word|
        memo.length > word.length ? memo : word
      end
      expect(longest).to eql('sheep')
    end
  end
end
