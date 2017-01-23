class RemoveVideo
  attr_accessor :video

  def initialize(video)
    self.video = video
  end

  def run
    return if video.panda_video_id.blank?
    pvideo = Panda::Video::find(video.panda_video_id)
    pvideo.delete
    video.panda_video_id = nil
    video.save
  end
end
