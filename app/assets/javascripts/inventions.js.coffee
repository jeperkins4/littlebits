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
    pagingType: "simple_numbers"
    autoWidth: false
    processing: true
    order: [[0,'desc']]
    serverSide: true
    ajax: $("#inventions").data('source')
    createdRow: (row, data, index) ->
      $('td', row).eq(0).addClass 'title'
      $('td', row).eq(1).addClass 'poster'
      $('td', row).eq(2).addClass 'user_name'
      $('td', row).eq(3).addClass 'bits'
      $('td', row).eq(4).addClass 'materials'
      $('td', row).eq(5).addClass 'links'
      # 0 is index of column
      return
