class CountriesController < ApplicationController
  def show
    country = Country.with_currency.by_code(params[:country_code])
    render json: country, include: :currency
  end
end
