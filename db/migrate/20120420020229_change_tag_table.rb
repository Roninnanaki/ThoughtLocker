class ChangeTagTable < ActiveRecord::Migration
  def change 
  	change_table :tags do |t|
  		t.rename :tag, :name
  	end 
  end
end
