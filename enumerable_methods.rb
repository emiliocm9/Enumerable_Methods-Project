module Enumerable
    def my_each
        return to_enum unless block_given?
        i = 0
        j = 0
        while i < length
          yield self[i] if is_a?(Array) || is_a?(Range)
          yield keys[j], values[j] if is_a?(Hash)
          i += 1
          j += 1
        end
        self
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