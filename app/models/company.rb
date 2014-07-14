class Company < ActiveRecord::Base

  searchkick word_start: [:name]

  has_and_belongs_to_many :users
  validates :name, :url, :address, presence: true
  validates :name, :url, uniqueness: true

end
