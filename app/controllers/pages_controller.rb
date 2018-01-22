class PagesController < ApplicationController
  def home
    @rooms = Room.all
    @rooms_by_rtype = Room.all.alphabetical
    @rooms_by_price = Room.all.price_ascending
    @room_types = Room.all.group_by_type
  end
end
