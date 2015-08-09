$ ->
  $('.visited-mark').bind('change.visit', ->
    checkbox = $(this)
    if checkbox.is(":checked")
      markVisited(checkbox.val())
    else
      markNotVisited(checkbox.val())
  )

  markVisited = (country_id) ->
    $.ajax(
      method: "POST"
      url: "/countries_users_relations"
      data:
        country_id: country_id
    )

  markNotVisited = (country_id) ->
    $.ajax(
      method: "DELETE"
      url: "/countries_users_relations/#{country_id}"
    )
