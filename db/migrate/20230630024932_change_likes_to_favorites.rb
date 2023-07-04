class ChangeLikesToFavorites < ActiveRecord::Migration[7.0]
  def change
    
    remove_column :likes, :user_id, :integer
    remove_column :likes, :post_id, :integer
    add_column :likes, 
    rename_table :likes, :favorites
  end
end
