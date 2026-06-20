class CreateBlogs < ActiveRecord::Migration[8.1]
  def change
    create_table :blogs do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
