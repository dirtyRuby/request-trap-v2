# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
scheme = 'wss://'
uri = scheme + window.document.location.host + '/websocket'
dispatcher = new WebSocketRails(uri)
trap_channel = dispatcher.subscribe('trap')
request_channel = dispatcher.subscribe('request')
trap_channel.bind('new', ((trap) ->
  $('.trap-list tbody tr:first').before(trap)
  rewriteNumeration('.listing-table tbody')
  )
)
request_channel.bind('new', ((request) ->
  $('.request-list tbody tr:first').before(request)
  rewriteNumeration('.listing-table tbody')
  )
)

ready = ->
  tableLine = $('.listing-table tbody tr')
  tableLine.mouseover ->
   $(this).addClass('focused')
  tableLine.mouseleave ->
   $(this).removeClass('focused')
  $('.edit-btn').click ->
   slider('.edit-form')
$(document).on("page:load", ready)
$(document).ready(ready)