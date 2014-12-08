class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.references :poker_game, index: true
      t.references :user, index: true
    end
  end
end
