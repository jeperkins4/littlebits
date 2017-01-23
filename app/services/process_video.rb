class ProcessVideo
  attr_accessor :video

  def initialize(video)
    self.video = video
  end

  def run
    pvideo = Panda::Video.create(source_url: self.video.media.url)
    until pvideo.reload.status == 'success'
      pvideo.encodings['h264.1'].reload
    end
    self.video.panda_video_id = pvideo.id
    self.video.save
    ActionCable.server.broadcast "invention_channel", invention_id: self.video.invention_id,
      message: "Video #{video.name} has completed processing",
      panda_video_id: self.video.panda_video_id
  end
end
