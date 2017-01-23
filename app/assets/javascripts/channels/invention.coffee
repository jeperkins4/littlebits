App.invention = App.cable.subscriptions.create "InventionChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # console.log "DEBUG: RECEIVED DATA: " + data.message + " for " + data.invention_id
    pathname = "/inventions/"+data.invention_id
    index_path = "/inventions"
    if window.location.pathname == pathname
      $('#invention_status_button').removeClass('btn-default').addClass('btn-success')
      $('#invention_status').fadeIn 3000, ->
        $('#invention_status').text data.status
        return
      $('#status').text data.status
      $('#time').text data.time
    if window.location.pathname == index_path
      d = new Date(data.message.timestamp)
      options = { month: "long", year: "numeric", day: "numeric", hour: "numeric", minute: "numeric"}
      $('tr#invention_' + data.invention_id).fadeOut(500).fadeIn(500)
      $('tr#invention_' + data.invention_id + ' td.timestamp').text d.toLocaleDateString('en', options)
      $('tr#invention_' + data.invention_id + ' td.status').text(data.status)

  speak: (message) ->
    @perform 'speak', message: message
