class Company < ActiveRecord::Base

  has_and_belongs_to_many :users
  validates :co_name, :co_url, :co_address, presence: true
  validates :co_name, :co_url, uniqueness: true

end
