$ ->
  $('#save-trip').bind('click.trip', ->
    description = $('#description').val()
    startDate = $('#start-date').val()
    endDate = $('#end-date').val()
    visited = (c.value for c in $('#countries option:selected').toArray())
    $.ajax(
      method: "POST"
      url: "/trips"
      data:
        trip:
          description: description
          start_date: startDate
          end_date: endDate
          country_ids: visited
      success: -> window.location.href = '/trips'
    )
  )
