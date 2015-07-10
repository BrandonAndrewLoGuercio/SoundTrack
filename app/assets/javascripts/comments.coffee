$(document).on "page:change", ->
  $('a.comments-link').click (e) ->
    e.preventDefault()
    parent = $(e.target).parent().parent()
    parent.find('.comments-section').fadeToggle()
    parent.find('.comments-section > .comment_form > .form-group > .form-control').focus()
    comments = parent.find('.comments-section > .comments')
