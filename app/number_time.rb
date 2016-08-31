require_relative '../app/exceptions/validate_number_time_error'

class NumberTime
  attr_accessor :number, :max_limit, :min_limit

  def initialize number = nil
    self.number = number unless number.nil?
    @@cast_number_table = {0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen', 20 => 'twenty', 30 => 'thirty'}
  end

  def number= number
    @number = number

    raise ValidateNumberTimeError.new("Number should be between #{@min_limit} and #{@max_limit}") unless validate_number
  end

  def validate_number
    @number.between? @min_limit, @max_limit
  end
end