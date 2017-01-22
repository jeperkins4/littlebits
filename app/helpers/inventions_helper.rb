module InventionsHelper
  def poster(invention)
    return if invention.photos.empty?
    photo = invention.photos.first
    content_tag(:div, image_tag(photo.media.url, class: 'thumbnail img-round', alt: photo.name))
  end

  def bits(invention)
    unless invention.bits.blank?
      content_tag(:div, invention.bits.reject(&:blank?).join(", "))
    end
  end

  def materials(invention)
    unless invention.materials.blank?
      invention.materials.reject(&:blank?).join(", ")
    end
  end
end
