class AddPictureToUsers < ActiveRecord::Migration

    def self.up
    remove_column :users, :picture
    add_attachment :users, :picture
  end

  def self.down
    remove_attachment :users, :picture
    add_column :users, :picture, :string
  end
end

