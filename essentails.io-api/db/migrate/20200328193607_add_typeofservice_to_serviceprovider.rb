class AddTypeofserviceToServiceprovider < ActiveRecord::Migration[5.0]
  def change
    add_column :serviceproviders , :type_of_service , :string
  end
end
