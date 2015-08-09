class CountriesUsersRelationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up_relation
  respond_to :json

  def create
    render nothing: true, status: @relation.save ? 200 : 422
  end

  def destroy
    if @relation
      @relation.destroy
      render nothing: true, status: 204
    else
      render nothing: true, status: 410
    end
  end

  private

  def set_up_relation
    @relation = CountriesUsersRelation.where(user: current_user,
      country_id: params[:country_id]).first_or_initialize
  end
end
