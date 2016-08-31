require 'spec_helper'

describe Minute do
  let(:minute) {Minute.new}

  it 'should set the half minute identifier' do
    minute.number = 30
    expect(minute.half_hour_identifier).to eql 'past'

    minute.number = 31
    expect(minute.half_hour_identifier).to eql 'to'

    minute.number = 1
    expect(minute.half_hour_identifier).to eql 'past'

    minute.number = 59
    expect(minute.half_hour_identifier).to eql 'to'
  end

  it 'should convert minutes to word' do
    minute.number = 1
    expect(minute.cast_minutes_to_word).to eql 'one'

    minute.number = 59
    expect(minute.cast_minutes_to_word).to eql 'one'

    minute.number = 23
    expect(minute.cast_minutes_to_word).to eql 'twenty three'

    minute.number = 35
    expect(minute.cast_minutes_to_word).to eql 'twenty five'
  end

  it 'should return the sentence' do
    minute.number = 0
    expect(minute.minutes_sentence).to eq 'o\'clock'

    minute.number = 15
    expect(minute.minutes_sentence).to eq 'quarter past'

    minute.number = 30
    expect(minute.minutes_sentence).to eq 'half past'

    minute.number = 45
    expect(minute.minutes_sentence).to eq 'quarter to'

    minute.number = 37
    expect(minute.minutes_sentence).to eq 'minutes to'

    minute.number = 13
    expect(minute.minutes_sentence).to eq 'minutes past'
  end

  it 'should return the full minutes sentence' do
    minute.number = 0
    expect(minute.to_word).to eq 'o\'clock'

    minute.number = 15
    expect(minute.to_word).to eq 'quarter past'

    minute.number = 45
    expect(minute.to_word).to eq 'quarter to'

    minute.number = 30
    expect(minute.to_word).to eq 'half past'

    minute.number = 28
    expect(minute.to_word).to eq 'twenty eight minutes past'

    minute.number = 47
    expect(minute.to_word).to eq 'thirteen minutes to'
  end

  it 'should verify if the hour come first' do
    minute.number = 0
    expect(minute.hour_first?).to be_truthy

    minute.number = 15
    expect(minute.hour_first?).to be_falsey
  end
end