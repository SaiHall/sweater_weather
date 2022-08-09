class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :password_confirmation

  has_secure_password

  def self.valid_key?(key)
    user = User.find_by(api_key: key)
    return true if !user.nil?
    return false if user.nil?
  end
end
