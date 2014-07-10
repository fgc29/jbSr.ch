class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.text :url
      t.text :logo
      t.string :address
      t.string :twitter_url
      t.integer :angel_list_id
      t.boolean :investor
      t.integer :rating

      t.timestamps
    end
  end
end
