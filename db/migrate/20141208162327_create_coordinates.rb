class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :street_address
      t.string :zipcode_address
      t.string :city_address
      t.string :lat
      t.string :lng
      t.references :poker_game, index: true
    end
  end
end
