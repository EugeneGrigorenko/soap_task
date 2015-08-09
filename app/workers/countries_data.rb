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
    parsed_xml.root.search('Table').each { |t| process_country_with_currency(t) }
  end

  def process_country_with_currency(table)
    country = get_updated_country(table)
    country.currency = get_updated_currency(table)
    country.save
  end

  def get_updated_country(table)
    country = find_country_record(get_text_from_tag('CountryCode', table))
    country.name = get_text_from_tag('Name', table)
    country
  end

  def get_updated_currency(table)
    code = get_text_from_tag('CurrencyCode', table)
    name = get_text_from_tag('Currency', table)
    find_currency_record(name, code) if code.present? || name.present?
  end

  def find_currency_record(name, code)
    Currency.where(name: name, code: code).first_or_create
  end

  def find_country_record(code)
    Country.where(code: code).first_or_initialize
  end

  def get_text_from_tag(css_name, table)
    table.at_css(css_name).children.text.strip
  end
end
