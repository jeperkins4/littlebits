module InventionsHelper
  def poster(invention)
    return if invention.photos.empty?
    photo = invention.photos.first
    content_tag(:div, image_tag(photo.media.url, class: 'thumbnail img-round', alt: photo.name))
  end

  def bits(invention)
    invention.bits.reject(&:blank?).join(", ") unless invention.bits.blank?
  end

  def materials(invention)
    invention.materials.reject(&:blank?).join(", ") unless invention.materials.blank?
  end
end
