$(document).on "page:change", ->
  $('a.comments-link').click (event) ->
    event.preventDefault()
    $('.comments-section').fadeToggle()
    $('.comment_comment').focus()
