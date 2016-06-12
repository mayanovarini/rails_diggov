class AddPoliticianIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :politician_id, :integer
  end
end
