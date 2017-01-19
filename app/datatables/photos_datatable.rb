class PhotosDatatable < BaseDatatable
  delegate :current_user, to: :@view

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Photo.count,
      iTotalDisplayRecords: photos.total_count,
      aaData: data
    }
  end

private
  def data
    photos.map do |photo|
      [
        link_to(photo.name, photo)
      ]
    end
  end

  def photos
    @photos || fetch_photos
  end

  def fetch_photos
    search_columns = ['photos.name']
    photos = Photo.unscoped.select(search_columns).order(sort_column sort_direction)
    photos = photos.page(page_count).per(per_page)
  end

  def sort_column
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
