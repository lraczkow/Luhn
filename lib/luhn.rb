module Luhn
  def self.is_valid?(number)
    digits = []
    reverse = []
    #break the credit card into individual digits.
    digits = number.to_s.split("")
    #double every second digit
    #If the doubled value is greater than or equal to 10, subtract 9 from value.
    reverse = digits.reverse
    reverse.each_with_index do | item, i | 
      if (i % 2 != 0) then 
        reverse[i] = item.to_i * 2 
        if reverse[i] >= 10 
          reverse[i] = reverse[i] - 9
        end
      end
    end

    #Sum the digits.
    sum = reverse.inject(0){|sum,x| sum + x.to_i }

    #If sum is divisible by 10 = valid. Otherwise, invalid.
    if sum % 10 == 0
      return true
    else
      return false
    end
  end
end