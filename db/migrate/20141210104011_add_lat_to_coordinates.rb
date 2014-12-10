class AddLatToCoordinates < ActiveRecord::Migration
  def change
    add_column :coordinates, :lat, :float
  end
end
