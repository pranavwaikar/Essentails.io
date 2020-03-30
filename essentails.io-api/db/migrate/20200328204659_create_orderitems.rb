class CreateOrderitems < ActiveRecord::Migration[5.0]
  def change
    create_table :orderitems do |t|
      t.string :name
      t.float :quantity
      t.float :price
      t.references :order, index: true, foreign_key: true
      t.timestamps
    end
  end
end
