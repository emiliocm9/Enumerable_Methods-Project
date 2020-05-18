module Enumerable
    def my_each
        return to_enum unless block_given?
        i = 0
        j = 0
        while i < length
        if is_a?(Array)
            yield self[i]

        elsif is_a?(Hash)
          yield keys[j], values[j]
        end
          j += 1
          i += 1
        end
    end
    

    def my_each_with_index
        return to_enum unless block_given?
        i = 0
        j = 0
        index = 0
        while i < length
        if is_a?(Array)
            yield self[i], index

        elsif is_a?(Hash)
          yield keys[j], values[j], index
        end
          index += 1
          j += 1
          i += 1
        end
    end

    def my_select 
        return to_enum unless block_given?
        array = []
        if self.is_a?(Hash)
        my_each { |i| array << i if yield(i) }

        else 
            my_each { |i| array << i if yield(i) }
        end
        array
    end


        color = [2, 5, 8, 7, 9, 10, 12, 14]
        p color.my_select {|item| item.even?}
      #h = {1 => "territorio", 2 => "escolar", 3 => "tercer", 4 => "dimension"}
      #k = ["tengo", "ganas", "de", "dormir"]
      #j = [1, 2, 3, 8, 4, 6, 9, 12]
      #h.my_each_with_index {|(keys, values), index| puts "my values is #{values} while my index is #{index}"}
      #h.my_each_with_index {|keys, values, index| puts "my item is #{values} while my index is #{index}"}












end