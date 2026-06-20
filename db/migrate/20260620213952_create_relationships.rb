class CreateRelationships < ActiveRecord::Migration[8.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_blog_id

      t.timestamps
    end
    add_index :relationships, [:follower_id, :followed_blog_id], unique: true
  end
end
