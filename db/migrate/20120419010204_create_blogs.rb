class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
