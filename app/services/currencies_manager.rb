class CurrenciesManager
  def initialize(params, user)
    @params = params
    @user = user
  end

  def list_for_user
    @currencies = Currency.with_countries_and_visits(@user.id).countries_users_reference.by_name
    hide_not_visited if @params[:hide_visited]
    @currencies
  end

  def show_for_user
    Currency.with_countries_and_visits(@user.id)
      .where(id: @params[:id]).countries_users_reference.to_a.first
  end

  private

  def hide_not_visited
    @currencies.to_a.delete_if do |currency|
      currency.not_visited_countries_size.zero?
    end
  end
end
