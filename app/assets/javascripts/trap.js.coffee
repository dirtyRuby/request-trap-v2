# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:load", ->
  tableLine = $('.listing-table tbody tr')
  tableLine.mouseover ->
   $(this).addClass('focused')
  tableLine.mouseout ->
   $(this).removeClass('focused')
  $('.edit-btn').click ->
   slider('.edit-form')
)