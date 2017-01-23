class Invention < ApplicationRecord
  belongs_to :user

  has_many :photos, dependent: :destroy
  has_one :video, dependent: :destroy

  accepts_nested_attributes_for :photos, :reject_if => proc{|a|a[:media].blank?}, allow_destroy: true
  accepts_nested_attributes_for :video, :reject_if => proc{|a|a[:media].blank?}, allow_destroy: true

  validates :title, presence: true

  serialize :bits, JSON
  serialize :materials, JSON


  def self.materials
    where.not(materials: nil).pluck(:materials).flatten.compact.uniq.reject{|x|x.blank?}.sort
  end
end
