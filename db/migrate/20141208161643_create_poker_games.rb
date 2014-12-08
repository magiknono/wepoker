class CreatePokerGames < ActiveRecord::Migration
  def change
    create_table :poker_games do |t|
      t.string :gametype
      t.date :date
      t.time :hour
      t.string :description
      t.integer :nb_players_required
      t.datetime :cancelled_at
      t.references :user, index: true
    end
  end
end
