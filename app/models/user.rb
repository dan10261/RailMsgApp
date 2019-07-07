class User < ApplicationRecord
  validates :username, uniqueness: {casesensitive: false}
  has_secure_password
end