class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :price
      t.string :status
      t.references :consumer, index: true, foreign_key: true
      t.references :serviceprovider, index: true, foreign_key: true
      t.timestamps
    end
  end
end
