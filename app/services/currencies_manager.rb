class CurrenciesManager
  def initialize(params, user)
    @params = params
    @user = user
  end

  def list_for_user
    if @params[:hide_visited]
      Currency.without_visited(@user.id)
    else
      Currency.with_countries_and_visits(@user.id).countries_users_reference
    end.by_name
  end

  def show_for_user
    Currency.with_countries_and_visits(@user.id)
      .where(id: @params[:id]).countries_users_reference.to_a.first
  end
end
