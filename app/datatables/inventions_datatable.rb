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
        '0' => poster(invention),
        '1' => link_to(invention.title, invention),
        '2' => invention.user_name,
        '3' => bits(invention),
        '4' => links(invention)
      }
    end
  end

  def inventions
    @inventions || fetch_results(Invention)
  end

  def columns
    ['inventions.title', 'inventions.user_name', 'inventions.bits', 'inventions.id']
  end

  def exceptions
    ['inventions.id']
  end
end
