require 'rails_helper'

RSpec.describe Hourly do
  before(:each) do
    json = File.read('./spec/fixtures/data3_exp.json')
    data = JSON.parse(json, symbolize_names: true)
    @hour = Hourly.new(data[0])
  end

  it 'exists and has attributes' do

    expect(@hour).to be_an_instance_of(Hourly)
    expect(@hour.time).to eq('17:00:00')
    expect(@hour.temperature).to eq(86.126)
    expect(@hour.conditions).to eq("overcast clouds")
    expect(@hour.icon).to eq("04d")
  end

  it 'can format unix into a readable time' do

    expect(@hour.time).to eq('17:00:00')

    expect(@hour.time).to_not eq(1659819600)
  end

  it 'can display temperature in fahrenheit' do

    expect(@hour.temperature).to eq(86.126)

    expect(@hour.temperature).to_not eq(303.22)
  end
end
