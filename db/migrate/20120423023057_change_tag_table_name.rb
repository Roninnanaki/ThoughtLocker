class ChangeTagTableName < ActiveRecord::Migration
  def change 
  	change_table :tags do |t|
  		t.rename :tag_name, :name
  	end 
  end
end
