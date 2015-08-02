require 'rails_helper'

describe CountriesController do
  describe 'GET #index' do
    before do
      country = build_stubbed(:country)
      allow(Country).to receive(:with_currency).and_return(Country)
      allow(Country).to receive(:by_code).and_return(country)
    end

    it 'should call by_code with code parameter' do
      code = Faker::Address.country_code
      expect(Country).to receive(:by_code).with(code)
      get :show, format: :json, country_code: code
    end

    it 'should response with 200' do
      get :show, format: :json, country_code: ''
      expect(response).to have_http_status(200)
    end
  end
end
