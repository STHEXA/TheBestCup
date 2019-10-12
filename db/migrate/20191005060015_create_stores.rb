class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.date :visit_day, null: false
      t.text :image, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end