class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :jlpt_level, :integer
    change_column_default :users, :jlpt_level, 5
  end
end
