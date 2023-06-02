class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.integer :agent_id
      t.integer :map_id
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
