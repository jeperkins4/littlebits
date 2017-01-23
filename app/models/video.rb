class Video < ApplicationRecord
  belongs_to :invention

  delegate :title, to: :invention, prefix: true, allow_nil: true

  mount_uploader :media, VideoUploader

  validates :media, file_size: { less_than: 10.megabytes } # This is a limit due to Telestream | Cloud free edition

  after_save :process_video
  before_destroy :clear_panda

  def panda_video
    unless self.panda_video_id.blank?
      @panda_video || Panda::Video.find(self.panda_video_id)
    end
  end

  private
  def process_video
    if self.media.present? && self.media_changed?
      ConvertVideoJob.perform_later(self)
    end
  end

  def clear_panda
    ClearVideoJob.perform_later(self)
    self.panda_video_id = nil
    @panda_video = nil
  end
end
