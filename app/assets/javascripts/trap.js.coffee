# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

dispatcher = new WebSocketRails('localhost:3000/websocket')
trap_channel = dispatcher.subscribe('trap')
request_channel = dispatcher.subscribe('request')
trap_channel.bind('new', ((trap) ->
    $('.listing-table tbody tr:first').before(trap)
    alert(1)
  )
)
request_channel.bind('new', ((request) ->
    $('.listing-table tbody tr:first').before(request)
    alert(2)
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