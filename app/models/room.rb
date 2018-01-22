class Room < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :themes
  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings, source: :user

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bedroom_count, presence: true
  validates :bathroom_count, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :address, presence: true

  def self.alphabetical
      order(room_type: :asc)
  end
  scope :price_ascending, -> { order(price: :asc) }
  scope :group_by_type, -> { group(:room_type) }

  def bargain?
    price < 30
  end

  def available?(checkin, checkout)
    bookings.each do |booking|
      if (booking.starts_at <= checkout) && (booking.ends_at >= checkin)
        return false
      end
    end

    true
  end
end
