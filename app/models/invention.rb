class Invention < ApplicationRecord
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos, :reject_if => proc{|a|a[:media].blank?}, allow_destroy: true

  validates :title, presence: true

  serialize :bits, JSON
  serialize :materials, JSON
end
