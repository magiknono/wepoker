class AddDetailsToPokerGames < ActiveRecord::Migration
  def change
    add_column :poker_games, :street_address, :string
    add_column :poker_games, :zipcode_address, :string
    add_column :poker_games, :city_address, :string
    add_column :poker_games, :lat, :float
    add_column :poker_games, :lng, :float
  end
end
