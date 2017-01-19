$ ->
  $("#photos").dataTable
    dom: "<'row'<'col-md-7'l><'col-md-5'f>r>t<'row'<'col-md-7'i><'col-md-5'p>>"
    pagingType: "simple_numbers"
    autoWidth: false
    processing: true
    order: [[0,'desc']]
    serverSide: true
    ajax: $("#photos").data('source')
