require 'spec_helper'
require_relative '../app/exceptions/validate_number_time_error'

describe NumberTime do
  let(:number_time) {NumberTime.new}

  it 'should be between the limits' do
    number_time.min_limit = 1
    number_time.max_limit = 10

    msg = 'Number should be between 1 and 10'

    expect{number_time.number = 11}.to raise_error(ValidateNumberTimeError, msg)
    expect{number_time.number = 0}.to raise_error(ValidateNumberTimeError, msg)
    number_time.number = 5
    expect(number_time.number).to be 5
  end
end