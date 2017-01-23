class ClearVideoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    video = args.first
    RemoveVideo.new(video).run
  end
end
