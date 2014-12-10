class AddLngToCoordinates < ActiveRecord::Migration
  def change
    add_column :coordinates, :lng, :float
  end
end
