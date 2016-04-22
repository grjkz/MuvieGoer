class User < ActiveRecord::Base
  has_secure_password
  validates :alias, presence: true, uniqueness: true
  validates :password, length: {minimum: 4}, confirmation: true
  validates :password_confirmation, presence: true
end
