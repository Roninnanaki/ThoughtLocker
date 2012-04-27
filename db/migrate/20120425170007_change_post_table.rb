class ChangePostTable < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  	  t.remove :filename
      t.remove :binary_data
    end
  end
end
