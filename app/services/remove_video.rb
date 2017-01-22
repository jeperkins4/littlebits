class RemoveVideo
  attr_accessor :invention

  def initialize(invention)
    self.invention = invention
  end

  def run
    video = Panda::Video::find(invention.panda_video_id)
    video.delete
    invention.panda_video_id = nil
    invention.save
  end
end
