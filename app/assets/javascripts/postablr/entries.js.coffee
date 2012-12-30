# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

#= require redactor-rails

$ ->
  $('.datepicker').datepicker()
  $(document).on "page:change", ()->

    $(".redactor").redactor()

