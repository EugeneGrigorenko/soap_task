class CurrenciesController < ApplicationController
  def index
    if user_signed_in?
      @hide_visited = params[:hide_visited]
      @currencies = CurrenciesManager.new(params, current_user).list_for_user
    else
      @currencies = Currency.includes(:countries).by_name
    end
  end

  def show
    @currency = if user_signed_in?
      CurrenciesManager.new(params, current_user).show_for_user
    else
      Currency.includes(:countries).find(params[:id])
    end
  end
end
