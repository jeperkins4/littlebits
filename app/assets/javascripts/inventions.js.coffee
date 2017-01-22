$ ->
  $('select.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results found'
    width: '200px'

  $('.select2-with-add').select2
    theme: "bootstrap"
    tags: true
    tokenSeparators: [',', ' ']

  $("#inventions").dataTable
    dom: "<'row'<'col-md-7'l><'col-md-5'f>r>t<'row'<'col-md-7'i><'col-md-5'p>>"
    pagingType: "simple_numbers"
    autoWidth: false
    processing: true
    order: [[0,'desc']]
    serverSide: true
    ajax: $("#inventions").data('source')
