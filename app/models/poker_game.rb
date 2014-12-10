class PokerGame < ActiveRecord::Base
  belongs_to :user
  has_one :coordinate
  accepts_nested_attributes_for :coordinate


end