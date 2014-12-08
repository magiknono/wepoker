class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :phone_verified, :boolean
    add_column :users, :birthday, :date
  end
end
