class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :co_name
      t.text :co_description
      t.text :co_url
      t.text :co_logo
      t.string :co_address

      t.timestamps
    end
  end
end
