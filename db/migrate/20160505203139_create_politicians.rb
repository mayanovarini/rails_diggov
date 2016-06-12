class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :party
      t.string :occupation
      t.string :country
      t.string :area
      t.string :wikipage

      t.timestamps null: false
    end
  end
end
