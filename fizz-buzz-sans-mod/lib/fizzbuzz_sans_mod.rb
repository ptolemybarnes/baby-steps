class Fixnum

  def fizzbuzz
    if self.divisible_by?(3) and self.divisible_by?(5)
      "FizzBuzz"
    elsif self.divisible_by?(3)
      "Fizz"
    elsif self.divisible_by?(5)
      "Buzz"
    else
      self.to_s
    end
  end

  def divisible_by?(divisor)
    (self / divisor.to_f) == self / divisor
  end

end