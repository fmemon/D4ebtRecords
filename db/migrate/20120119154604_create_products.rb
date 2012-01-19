class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :cost
      t.integer :stock

      t.timestamps
    end
    
    Product.create :name => "flip flops", :description => "pink and yellow flips flops size 21", :cost => 111.11, :stock => 2333
    Product.create :name => "sunray glasses", :description => "purple sparkly sunglasses that catch the sun and people's grazes", :cost => 22.22, :stock => 9
    
    
  end
end
