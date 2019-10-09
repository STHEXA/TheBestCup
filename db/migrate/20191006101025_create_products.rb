class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.integer :price
      t.string :taste, null:false
      t.string :memo
      t.text :image
      t.references :store, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end