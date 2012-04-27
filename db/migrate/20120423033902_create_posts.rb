class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :source
      t.string :filename
      t.binary :binary_data

      t.timestamps
    end
  end
end
