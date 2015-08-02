class CountriesData
  include Singleton

  def update
    response = request_data
    parse_and_save_xml(response)
  end

  private

  def request_data
    client = Savon.client(wsdl: Figaro.env.currency_service_link)
    get_rsponse_xml(client.call(:get_currencies))
  end

  def get_rsponse_xml(response)
    response.body[:get_currencies_response][:get_currencies_result]
  end

  def parse_and_save_xml(str)
    parsed_xml = Nokogiri.XML(str)
    parsed_xml.root.search('Table').each { |t| update_country(t) }
  end

  def update_country(table)
    country = find_country_by_code(table.at_css('CountryCode').children.text)
    country.name = table.at_css('Name').children.text
    country.currency = update_currency(country.id, table)
    country.save
  end

  def update_currency(country_id, table)
    currency = Currency.where(country_id: country_id).first_or_initialize
    currency.code = table.at_css('CurrencyCode').children.text
    currency.name = table.at_css('Currency').children.text
    currency
  end

  def find_country_by_code(code)
    Country.where(code: code).first_or_initialize
  end
end
