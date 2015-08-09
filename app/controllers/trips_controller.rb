class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = Trip.includes(:countries).order(end_date: :desc)
  end

  def new
    @countries = Country.all
  end

  def create
    trip = Trip.new(create_trip_params.merge(user: current_user))
    if trip.save
      trip.mark_visited_countries
      render nothing: true, status: 200
    else
      render nothing: true, status: 422
    end
  end

  private

  def create_trip_params
    params.require(:trip).permit(:start_date, :end_date, :description, country_ids: [])
  end
end
