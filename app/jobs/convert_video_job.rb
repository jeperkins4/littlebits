class ConvertVideoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    video = args.first
    ProcessVideo.new(video).run
  end
end
