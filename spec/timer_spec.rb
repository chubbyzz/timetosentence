require 'spec_helper'

describe Timer do
  it 'should show the time in words' do
    expect(sentence(5, 0)).to eql 'five o\'clock'
    expect(sentence(5, 1)).to eql 'one minute past five'
    expect(sentence(5, 59)).to eql 'one minute to six'
    expect(sentence(5, 10)).to eql 'ten minutes past five'
    expect(sentence(5, 30)).to eql 'half past five'
    expect(sentence(5, 40)).to eql 'twenty minutes to six'
    expect(sentence(5, 45)).to eql 'quarter to six'
    expect(sentence(5, 47)).to eql 'thirteen minutes to six'
    expect(sentence(5, 28)).to eql 'twenty eight minutes past five'
  end
end

def sentence hoer, minute
  Timer.new(hoer, minute).to_words
end