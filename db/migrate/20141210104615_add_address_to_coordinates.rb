class AddAddressToCoordinates < ActiveRecord::Migration
  def change
        add_column :coordinates, :address, :string
  end
end
