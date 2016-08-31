require_relative '../app/hour'
require_relative '../app/minute'

class Timer
  def initialize hour, minute
    @hour = Hour.new hour
    @minute = Minute.new minute
  end

  def to_words
    @hour.add_one_more if @minute.half_hour_identifier == 'to'
    @minute.hour_first? ? "#{@hour.to_word} #{@minute.to_word}" : "#{@minute.to_word} #{@hour.to_word}"
  end
end