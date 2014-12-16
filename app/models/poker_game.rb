class PokerGame < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  # @Depreciated @pokergame.user use @pokergame.creator instead
  alias_method :user, :creator
  has_many :game_participations
  has_many :users, through: :game_participations

  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode

  def address
    "#{self.street_address} #{self.zipcode_address} #{self.city_address}"
  end

  def participate?(user)
    # user.game_participations.where("poker_game_id = ?", self.id)
    self.users.include?(user)
  end

end


# @pokergame.creator
# @user.poker_games.first.creator == @user  # created

# @pokergame.users
# @user.participate_poker_games
