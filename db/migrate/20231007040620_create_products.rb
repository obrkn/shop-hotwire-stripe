class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :product_id, null: false
      t.string :title, null: false
      t.float :price, null: false
      t.text :description, null: false
      t.string :category, null: false
      t.text :image, null: false
      t.float :rating_rate, null: false
      t.integer :rating_count, null: false

      t.timestamps
    end
  end
end
