class TagsColumnRename < ActiveRecord::Migration
  change_table :tags do |t|
  		t.rename :tag_name, :tag_name
  	end
end
