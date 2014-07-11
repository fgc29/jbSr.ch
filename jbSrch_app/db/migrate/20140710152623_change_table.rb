class ChangeTable < ActiveRecord::Migration
  def up
    add_column :companies, :hi_concept, :string
    add_column :companies, :founders, :text
    add_column :companies, :market, :string
    add_column :companies, :email, :string
    add_column :companies, :employee_count, :integer
  end
end
