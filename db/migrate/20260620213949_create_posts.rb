class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :source
      t.references :blog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
