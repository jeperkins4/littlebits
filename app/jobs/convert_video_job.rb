class ConvertVideoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    invention = args.first
    ProcessVideo.new(invention).run
  end
end
