class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: /[a-z0-9.]+@([a-z0-9]+\.)+[a-z]{2,4}/, message: "must be a valid email"} 
end
