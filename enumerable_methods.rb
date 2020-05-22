# rubocop:disable Style/CaseEquality
# frozen_string_literal: true

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
      to_a.my_each { |item| return true ? yield(item) : false }
    elsif param.class == Class
      to_a.my_each { |item| return false unless item.class == param }
    elsif param.class == Regexp
      to_a.my_each { |item| return false unless item =~ param}
    elsif param
      to_a.my_each {|item| return false unless item == param}
    else
      to_a.my_each {|item| return false unless item}
    end
    true
  end

  def my_any?(par = nil)
    if block_given?
      to_a.my_each {|item| return true if yield(item)}
    elsif par.class == Class
      to_a.my_each {|item| return true if item.is_a? par}
    elsif par.class == Regexp
      to_a.my_each {|item| return true if item =~ par}
    elsif par
      to_a.my_each {|item| return true if item == par}
    else
      to_a.my_each {|item| return true if item}
    end
      false
  end

  def my_none?(var = nil)
    if block_given?
      to_a.my_each {|item| return false if yield(item)}
    elsif var.class == Class
      to_a.my_each {|item| return false if item.is_a? var}
    elsif var.class == Regexp
      to_a.my_each { |item| return false if item =~ var}
    elsif var
      to_a.my_each {|item| return false if item == var}
    else
      to_a.my_each {|item| return false if item}
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
    if block_given?
      to_a.my_each {|item| new_array << yield(item)}
      new_array
    elsif var == Proc
      to_a.my_each {|item| new_array << proc.call(item)}
      new_array
    end
  end

  def my_inject(*args)
    arr = to_a.dup
    return raise ArgumentError, 'Given arguments 0, expected 1' if args.empty? && !block_given?
    first = args.length == 2 && arr.respond_to?(args[1]) || args.length == 1 && block_given? ? args[0] : arr.shift
    sym = if args.length == 2
      args[1]
    elsif !block_given? && args.length == 1 && arr.respond_to?(args[0])
      args[0]
    else
      false
    end
    arr.my_each { |item| first = sym ? first.send(sym, item) : yield(first, item) }
    first
  end
  
  def multiply_els(arrays)
    arrays.my_inject(:*)
  end
end

# rubocop:enable