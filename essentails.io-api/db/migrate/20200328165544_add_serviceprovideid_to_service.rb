class AddServiceprovideidToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services , :serviceprovider_id , :integer
  end
end
