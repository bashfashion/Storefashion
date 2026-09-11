class CreateSettings < ActiveRecord::Migration[8.1]
  def change
    create_table :settings do |t|
      t.decimal :rate

      t.timestamps
    end
  end
end
