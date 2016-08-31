require 'spec_helper'

describe Hour do
  it 'should write the hour' do
    expect(Hour.new(5).to_word).to eql 'five'
    expect(Hour.new(12).to_word).to eql 'twelve'
    expect(Hour.new(1).to_word).to eql 'one'
  end

  it 'should add one more houer' do
    hoer = Hour.new

    hoer.number = 5
    expect(hoer.add_one_more).to eql 6

    hoer.number = 12
    expect(hoer.add_one_more).to eql 1
  end
end