class ChangeFollewedName < ActiveRecord::Migration
  change_table :relationships do |t|
  	  t.rename :followed_id, :followed_blog_id
  end
end
