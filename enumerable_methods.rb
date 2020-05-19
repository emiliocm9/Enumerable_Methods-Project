# rubocop:disable Style/CaseEquality, Style/CaseEquality

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
        if self.is_a?(Hash)
            hash = {}
            my_each {|i, value|  hash[i] = value if yield i, value}
        else
            hash = []
            my_each {|i| hash << i if yield(i)}
        end
        hash
    end

    def my_all?( par = nil )
      if block_given?
        my_each { |item| return true ? yield(item) : false }
      elsif par.class == Class
        self.my_each { |item| return false unless item.class == par }
      elsif par.class == Regexp
        self.my_each { |item| return false unless item =~ par}
      else
        self.my_each {|item| return false unless item}
      end
      true
    end

        color = [1, 2, 5, 4, 8]
        p color.my_all?
      #h = {1 => "territorio", 2 => "escolar", 3 => "tercer", 4 => "dimension"}
      #k = ["tengo", "ganas", "de", "dormir"]
      #j = [1, 2, 3, 8, 4, 6, 9, 12]
      #h.my_each_with_index {|(keys, values), index| puts "my values is #{values} while my index is #{index}"}
      #h.my_each_with_index {|keys, values, index| puts "my item is #{values} while my index is #{index}"}












end