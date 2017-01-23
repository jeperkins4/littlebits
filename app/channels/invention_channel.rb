class InventionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "invention_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  #def speak(data)
  #  ActionCable.server.broadcast "invention_channel", message: data['message']
  #end
end
