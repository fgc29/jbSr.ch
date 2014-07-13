class Company < ActiveRecord::Base

  searchkick

  # Company BONSAI_INDEX_NAME

  has_and_belongs_to_many :users
  validates :name, :url, :address, presence: true
  validates :name, :url, uniqueness: true

  # def self.search(search)
  #   search_condition = "%" + search + "%"
  #   find(:all, :conditions => ['name LIKE ? OR description LIKE ?',
  #   search_condition, search_condition])
  # end


end
