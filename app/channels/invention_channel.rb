class InventionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "invention_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
