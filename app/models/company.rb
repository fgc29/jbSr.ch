class Company < ActiveRecord::Base

  searchkick

  has_and_belongs_to_many :users
  validates :name, :url, :address, presence: true
  validates :name, :url, uniqueness: true

end
