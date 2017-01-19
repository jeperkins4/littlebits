//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap3-typeahead.min
//= require bootstrap3-autocomplete-input.min
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.tableTools
//= require dataTables/extras/dataTables.responsive
//= require cocoon
//= require chosen-jquery
//= require select2-full
//= require_tree .
//= require_self

$ ->
  $('.dropdown-toggle').dropdown()

  $("#main").on "pjax:end", ->
    $("select").chosen allow_single_deselect: true
    $(".datepicker").datetimepicker()

  $.ajaxSetup beforeSend: (xhr) ->
    xhr.setRequestHeader "Accept", "text/javascript"
    xhr.setRequestHeader "Accept", "application/json"

  $.ajaxSetup headers:
    "X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr("content")
