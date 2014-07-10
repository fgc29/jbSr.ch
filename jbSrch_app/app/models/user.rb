class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :companies
  validates :username, :first_name, :last_name, :email, presence: true
  validates :username, uniqueness: true
end
