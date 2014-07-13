class Company < ActiveRecord::Base

  searchkick

  index_name BONSAI_INDEX_NAME

  has_and_belongs_to_many :users
  validates :name, :url, :address, presence: true
  validates :name, :url, uniqueness: true

end
