class AddColumnPermalinkAndYear < ActiveRecord::Migration
    def up
      add_column :companies, :founded, :integer
      add_column :companies, :crunchbase_permalink, :string

    end  
end
