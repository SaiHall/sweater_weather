require 'rails_helper'

RSpec.describe Daily do
  before(:each) do
    json = File.read('./spec/fixtures/data2_exp.json')
    data = JSON.parse(json, symbolize_names: true)
    @day = Daily.new(data[0])
  end

  it 'exists and has attributes' do

    expect(@day).to be_an_instance_of(Daily)
    expect(@day.date).to eq('2022-08-06')
    expect(@day.sunrise).to eq('2022-08-06 6:00:37')
    expect(@day.sunset).to eq('2022-08-06 8:20:20')
    expect(@day.conditions).to eq("clear sky")
    expect(@day.max_temp).to eq(88.952)
    expect(@day.min_temp).to eq(69.026)
    expect(@day.temperature).to eq(78.989)
    expect(@day.icon).to eq("01d")
  end

  it 'can format unix into a readable time' do

    expect(@day.date).to eq('2022-08-06')
    expect(@day.sunrise).to eq('2022-08-06 6:00:37')
    expect(@day.sunset).to eq('2022-08-06 8:20:20')

    expect(@day.date).to_not eq(1659805200)
    expect(@day.sunrise).to_not eq(1659780037)
    expect(@day.sunset).to_not eq(1659831620)
  end

  it 'can display temperature in fahrenheit' do

    expect(@day.max_temp).to eq(88.952)
    expect(@day.min_temp).to eq(69.026)

    expect(@day.max_temp).to_not eq(304.79)
    expect(@day.min_temp).to_not eq(293.72)
  end

  it 'can average temperatures together' do

    expect(@day.temperature).to eq(78.989)
    expect(@day.temperature).to_not eq(88.952)
    expect(@day.temperature).to_not eq(69.026)
  end
end
