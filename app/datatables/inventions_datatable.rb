class InventionsDatatable < BaseDatatable
  delegate :poster, :bits, :materials, to: :@view

  def as_json(options = {})
    json_builder(Invention.count, inventions.total_count, data)
  end


private
  def data
    inventions.map do |invention|
      {
        'DT_RowId' => ["invention",invention.id].join('_'),
        '0' => link_to(content_tag(:h4, invention.title), invention),
        '1' => poster(invention),
        '2' => name_w_label(invention),
        '3' => bits_w_label(invention),
        '4' => materials_w_label(invention),
        '5' => links(invention)
      }
    end
  end

  def inventions
    @inventions || fetch_results(Invention)
  end

  def columns
    ['inventions.title', 'inventions.user_name', 'inventions.bits', 'inventions.materials', 'inventions.id']
  end

  def exceptions
    ['inventions.id']
  end

  def name_w_label(invention)
    html = []
    unless invention.user_name.blank?
      html << content_tag(:label, 'User:', class: 'col-md-2')
      html << content_tag(:div, invention.user_name, class: 'col-md-10')
    end
    content_tag(:div, html.join('').html_safe, class: 'row')
  end

  def bits_w_label(invention)
    html = []
    unless invention.bits.blank?
      html << content_tag(:label, 'Bits:', class: 'col-md-2')
      html << content_tag(:div, bits(invention), class: 'col-md-10')
    end
    content_tag(:div, html.join('').html_safe, class: 'row')
  end

  def materials_w_label(invention)
    html = []
    unless invention.materials.blank?
      html << content_tag(:label, 'Materials:', class: 'col-md-2')
      html << content_tag(:div, materials(invention), class: 'col-md-10')
    end
    content_tag(:div, html.join('').html_safe, class: 'row')
  end
end
