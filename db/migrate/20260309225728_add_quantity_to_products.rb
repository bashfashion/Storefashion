class AddQuantityToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :quantity, :integer
  end
end
