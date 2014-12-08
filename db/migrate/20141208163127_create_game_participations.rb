class CreateGameParticipations < ActiveRecord::Migration
  def change
    create_table :game_participations do |t|
      t.boolean :is_accepted
      t.datetime :answered_at
      t.references :user, index: true
      t.references :poker_game, index: true
    end
  end
end
