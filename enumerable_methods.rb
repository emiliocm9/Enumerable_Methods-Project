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

    def my_all?(param = nil)
      if block_given?
        my_each { |item| return true ? yield(item) : false }
      elsif param.class == Class
        self.my_each { |item| return false unless item.class == param }
      elsif param.class == Regexp
        self.my_each { |item| return false unless item =~ param}
      elsif param
        self.my_each {|item| return false unless item == param}
      else
        self.my_each {|item| return false unless item}
      end
      true
    end

    def my_any?(par = nil)
      if block_given?
        my_each {|item| return true if yield(item)}
      elsif par.class == Class
        my_each {|item| return true if item.is_a? par}
      elsif par.class == Regexp
        my_each {|item| return true if item =~ par}
      elsif par
        my_each {|item| return true if item == par}
      else
        my_each {|item| return true if item}
      end
        false
    end

    def my_none?(var = nil)
        if block_given?
          my_each {|item| return false if yield(item)}
        elsif var.class == Class
          my_each {|item| return false if item.is_a? var}
        elsif var.class == Regexp
          my_each { |item| return false if item =~ var}
        elsif var
          my_each {|item| return false if item == var}
        else
          my_each {|item| return false if item}
        end
        true
    end

    def my_count(var = nil)
      new_array =[]
      i = 1
      if var
        my_each {|item| new_array << item if item == var}
        new_array = new_array.length
      elsif block_given?
        my_each {|item| new_array << item if yield(item)}
        new_array = new_array.length
      else
        while i < length + 1
          new_array << i
          i += 1
        end
       new_array = new_array[-1]
      end
      new_array
    end

    def my_map(var = nil)
      new_array = []
      i = 0
      .to_i.to_a
      if block_given?
        my_each {|item| new_array << yield(item)}
        new_array
      end
    end
        color = (0..9)
       p color.my_map {|item| item * 2}
      #h = {1 => "territorio", 2 => "escolar", 3 => "tercer", 4 => "dimension"}
      #k = ["tengo", "ganas", "de", "dormir"]
      #j = [1, 2, 3, 8, 4, 6, 9, 12]
      #h.my_each_with_index {|(keys, values), index| puts "my values is #{values} while my index is #{index}"}
      #h.my_each_with_index {|keys, values, index| puts "my item is #{values} while my index is #{index}"}












end