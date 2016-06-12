class AddImageToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :image, :string
  end
end
