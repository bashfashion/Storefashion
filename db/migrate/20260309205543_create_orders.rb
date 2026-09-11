class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.string :currency
      t.string :status

      t.timestamps
    end
  end
end
