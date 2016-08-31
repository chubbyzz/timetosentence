require_relative '../app/number_time'

class Minute < NumberTime
  def initialize number = nil
    self.min_limit = 0
    self.max_limit = 59
    super(number)
  end

  def to_word
    minutes_words = cast_minutes_to_word
    minutes_words.nil? ? minutes_sentence : "#{minutes_words} #{minutes_sentence}"
  end

  def half_hour_identifier
    @number > 30 ? 'to' : 'past'
  end

  def cast_minutes_to_word
    return nil if @number == 0 or @number % 15 == 0
    number = @number
    if number > 30
      number = 60 - number
    end

    if number > 20
      return "#{@@cast_number_table[number - number % 20]} #{@@cast_number_table[number % 20]}"
    end
    @@cast_number_table[number]
  end

  def minutes_sentence
    if @number == 0
      return 'o\'clock'
    elsif @number % 15 == 0
      sentence = quarter_to_words
    else
      sentence = 'minutes'
      sentence = 'minute' if @number == 1 or @number == 59
    end
    "#{sentence} #{half_hour_identifier}"
  end

  def quarter_to_words
    @number == 30 ? 'half' : 'quarter'
  end

  def hour_first?
    @number == 0
  end
end