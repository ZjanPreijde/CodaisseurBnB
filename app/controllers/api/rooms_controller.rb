# app/controllers/api/rooms_controller.rb

class Api::RoomsController < ApplicationController
  def index
    render status: 200,
     json: { rooms: Room.all }.to_json
  end
end
