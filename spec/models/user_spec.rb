require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:password_confirmation)}
  end

  describe 'class methods' do
    it 'will return true if an api key is valid, and false if it is not' do
      User.create!(email: "Email@email.com", password: "12345", password_confirmation: "12345", api_key: SecureRandom.hex)
      user = User.all.first

      expect(User.valid_key?(user.api_key)).to eq(true)
      expect(User.valid_key?("Pants")).to eq(false)
    end
  end
end
