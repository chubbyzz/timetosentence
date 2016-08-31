require_relative '../app/number_time'

class Hour < NumberTime
  def initialize number = nil
    self.min_limit = 1
    self.max_limit = 12
    super(number)
  end

  def to_word
    @@cast_number_table[@number]
  end

  def add_one_more
    self.number = self.number == 12 ? 1 : self.number + 1
  end
end