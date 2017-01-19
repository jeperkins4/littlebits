class Photo < ApplicationRecord
  belongs_to :invention

  mount_uploader :media, MediaUploader
end
