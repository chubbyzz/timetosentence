require_relative '../app/exceptions/validate_number_time_error'
require_relative '../app/timer'

class Player
  def start
    timer = nil

    loop do
      validated = true

      puts 'write the hour'

      hour = gets.to_i
      puts 'write the minutes'
      minutes = gets.to_i

      begin
        timer = Timer.new(hour, minutes)
      rescue ValidateNumberTimeError
        puts 'Sorry!'
        puts 'The hour should be between 1 and 12!'
        puts 'The minutes should be between 0 and 59!'
        puts 'Try it again'
        validated = false
      end
      break if validated
    end

    puts timer.to_words
  end
end