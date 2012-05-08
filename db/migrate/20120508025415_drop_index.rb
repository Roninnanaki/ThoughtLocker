class DropIndex < ActiveRecord::Migration
  def up
  	remove_index(:relationships, :column => :follower_id)
  	remove_index(:relationships, :column => :followed_id)
  end

  def down
  end
end
