class AddProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category
      t.text :description
      t.string :title 
      t.integer :availability
      t.string :color
      t.string :size
      t.string :country_of_manufacture
      t.integer :total_count
      t.timestamps null: false
    end
  end
end
