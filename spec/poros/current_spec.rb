require 'rails_helper'

RSpec.describe Current do
  before(:each) do
    json = File.read('./spec/fixtures/data1_exp.rb')
    @data = JSON.parse(json, symbolize_names: true)
  end

  it 'exists and has attributes' do
    now = Current.new(@data)

    expect(now).to be_an_instance_of(Current)
    expect(now.date_time).to eq('2022-08-06 5:52:23')
    expect(now.sunrise).to eq('2022-08-06 6:00:37')
    expect(now.sunset).to eq('2022-08-06 8:20:20')
    expect(now.temperature).to eq(86.468)
    expect(now.feels_like).to eq(93.596)
    expect(now.humidity).to eq(64)
    expect(now.uvi).to eq(1.1)
    expect(now.visibility).to eq(10000)
    expect(now.conditions).to eq("overcast clouds")
    expect(now.icon).to eq("04d")
  end

  it 'can format unix into a readable time' do
    now = Current.new(@data)

    expect(now.date_time).to eq('2022-08-06 5:52:23')
    expect(now.sunrise).to eq('2022-08-06 6:00:37')
    expect(now.sunset).to eq('2022-08-06 8:20:20')

    expect(now.date_time).to_not eq(1659822743)
    expect(now.sunrise).to_not eq(1659780037)
    expect(now.sunset).to_not eq(1659831620)
  end

  it 'can display temperature in fahrenheit' do
    now = Current.new(@data)

    expect(now.temperature).to eq(86.468)
    expect(now.feels_like).to eq(93.596)

    expect(now.temperature).to_not eq(303.41)
    expect(now.feels_like).to_not eq(307.37)
  end
end
