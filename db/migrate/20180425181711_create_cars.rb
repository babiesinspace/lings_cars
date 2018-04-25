class CreateCars < ActiveRecord::Migration[5.2]
  def change
  	create_table :cars do |t|
  		t.string :model
  		t.string :description
  		t.integer :price
  		t.string :image
  		t.references :admin
  	end
  end
end
