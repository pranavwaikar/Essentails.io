class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.float :price
      t.string :unit
      t.float :max_order_limit
      t.string :out_of_stock
      t.timestamps
    end
  end
end
