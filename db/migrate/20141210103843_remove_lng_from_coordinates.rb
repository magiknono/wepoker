class RemoveLngFromCoordinates < ActiveRecord::Migration
  def change
     remove_column :coordinates, :lng, :string
  end
end
