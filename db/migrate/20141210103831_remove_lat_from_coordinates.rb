class RemoveLatFromCoordinates < ActiveRecord::Migration
  def change
     remove_column :coordinates, :lat, :string
  end
end
