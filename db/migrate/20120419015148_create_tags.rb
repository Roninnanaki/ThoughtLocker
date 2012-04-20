class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.integer :blog_id

      t.timestamps
    end
  end
end
