# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

#= require redactor-rails

$ ->

  $(document).on "page:change", ()->
    $('.datepicker').datepicker()
    $(".redactor").redactor()

