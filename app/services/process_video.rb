class ProcessVideo
  attr_accessor :invention

  def initialize(invention)
    self.invention = invention
  end

  def run
    video = Panda::Video.create(source_url: invention.video.url)
    until video.reload.status == 'success'
      video.encodings['h264.1'].reload
    end
    invention.panda_video_id = video.id
    invention.save
  end
end
