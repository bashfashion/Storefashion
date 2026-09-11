class RemoveCategoryFromProducts < ActiveRecord::Migration[8.1]
  def change
    remove_column :products, :category, :string
  end
end
