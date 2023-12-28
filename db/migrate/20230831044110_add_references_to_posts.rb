class AddReferencesToPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :user_id
    add_reference :posts, :user, foreign_key:true
  end
end