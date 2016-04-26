class User < ActiveRecord::Base
  has_secure_password
  validates :alias, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 6, maximum: 20}
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 4}, confirmation: true
  validates :password_confirmation, presence: true

  has_many :reviews
  
end
