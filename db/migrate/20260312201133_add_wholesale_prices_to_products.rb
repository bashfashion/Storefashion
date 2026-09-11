class AddWholesalePricesToProducts < ActiveRecord::Migration[8.1]
  def change
  add_column :products, :price_retail_bs, :decimal
  add_column :products, :price_wholesale_bs, :decimal
  add_column :products, :price_retail_usd, :decimal
  add_column :products, :price_wholesale_usd, :decimal
  end
end
