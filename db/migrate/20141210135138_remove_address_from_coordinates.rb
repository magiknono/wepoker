class RemoveAddressFromCoordinates < ActiveRecord::Migration
  def change
    remove_column :coordinates, :address, :string
  end
end
