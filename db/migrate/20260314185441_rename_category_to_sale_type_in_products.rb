class RenameCategoryToSaleTypeInProducts < ActiveRecord::Migration[8.1]
  def change
    rename_column :products, :category, :sale_type
  end
end
