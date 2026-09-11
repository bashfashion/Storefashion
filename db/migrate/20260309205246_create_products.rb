class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price_usd
      t.decimal :price_bs
      t.string :category

      t.timestamps
    end
  end
end
