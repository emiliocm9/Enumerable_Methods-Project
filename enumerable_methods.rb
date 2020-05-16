module Enumerable
    def my_each
        return to_enum unless block_given?
        each { |i| yield(i) }
    end

    def my_each_with_index
        return to_enum unless block_given?
    
        i = 0
        while i < length
          yield(self[i], i)
          i += 1
        end
      end













end