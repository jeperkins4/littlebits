class Invention < ApplicationRecord
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos, :reject_if => proc{|a|a[:media].blank?}, allow_destroy: true

  validates :title, presence: true

  serialize :bits, JSON
  serialize :materials, JSON

  mount_uploader :video, VideoUploader

  after_save :process_video

  def panda_video
    @panda_video || Panda::Video.find(panda_video_id)
  end

  def self.materials
    where.not(materials: nil).pluck(:materials).flatten.compact.uniq.reject{|x|x.blank?}.sort
  end

  private
  def process_video
    if self.video.present? && self.video_changed?
      ConvertVideoJob.perform_later(self)
    end
  end
end
