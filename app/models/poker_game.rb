class PokerGame < ActiveRecord::Base
  belongs_to :user

  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode

  def address
    "#{self.street_address} #{self.zipcode_address} #{self.city_address}"
  end


end