module Luhn
  def self.is_valid?(number)
    #break credit card into individual digits
    #double every other digit
    change_num = []
    digits = number.to_s.split('').map(&:to_i)
    digits.reverse.each_with_index do |n, index|
      if index % 2 == 0
        double_num = n * 2
        change_num.push(double_num)
      else
        change_num.push(n)
      end
    end

    #if doubled value is greater than or equal to 10, subtract 9
    change_num.map do |i|
      if i >= 10
        i-9
      end
    end

    #sum the digits
    sum = change_num.inject(:+)
    #if sum is divisible by 10, it is valid, otherwise its invalid
    return sum % 10 == 0

  end
end