class CreateServiceproviders < ActiveRecord::Migration[5.0]
  def change
    create_table :serviceproviders do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :password
      t.string :area
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
