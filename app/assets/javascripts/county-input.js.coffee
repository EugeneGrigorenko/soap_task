$ ->
  $("#country").countrySelect();
  $("#country").val('Select country')

  applyResponse = (data) ->
    $('#country-code').text(data.code)
    $('#country-name').text(data.name)
    $('#country-currency').text(data.currency?.name or 'is not defined')
    $('#country-currency-code').text(data.currency?.code or 'is not defined')


  $("#country").bind('change', ->
    code = $("#country").countrySelect("getSelectedCountryData").iso2
    $.ajax(
      url: "/countries/#{code}"
      success: applyResponse
    )
  )
