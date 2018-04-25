class AddColumnsToAdmin < ActiveRecord::Migration[5.2]
  def change
  	change_table :admins do |t|
  		t.string :opener
  		t.string :info
  		t.string :closer
  	end
  end
end
