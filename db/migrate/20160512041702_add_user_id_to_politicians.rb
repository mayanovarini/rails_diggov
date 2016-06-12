class AddUserIdToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :user_id, :integer
    add_index :politicians, :user_id
  end
end
