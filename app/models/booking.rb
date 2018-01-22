class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  before_create :set_check_in_times

  def self.during(arrival, departure)
    arrival = arrival.change(hour: 14, min: 00, sec: 00)
    departure = departure.change(hour: 11, min: 00, sec: 00)

    starts_before_ends_after(arrival, departure)
      .or(ends_during(arrival, departure))
      .or(starts_during(arrival,departure))
  end

  def self.starts_before_ends_after(arrival, departure)
    #TODO: where statements
  end

  def self.starts_during(arrival, departure)
    #TODO: where statements
  end

  def self.ends_during(arrival, departure)
    #TODO: where statements
  end

  def set_total_price
    self.price = room.price
    total_days = (ends_at.to_date - starts_at.to_date).to_i
    self.total = price * total_days
  end

  def room_available?
    room.available? starts_at, ends_at
  end

  private

  def set_check_in_times
    self.starts_at = starts_at.change(hour: 14, min: 00, sec: 00)
    self.ends_at = ends_at.change(hour: 11, min: 00, sec: 00)
  end
end
