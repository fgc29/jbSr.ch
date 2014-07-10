class Company < ActiveRecord::Base

  has_and_belongs_to_many :users
  validates :name, :url, :address, presence: true
  validates :name, :url, uniqueness: true

end
