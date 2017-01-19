class UsersDatatable < BaseDatatable
  delegate :current_user, to: :@view

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.count,
      iTotalDisplayRecords: users.total_count,
      aaData: data
    }
  end

private
  def data
    users.map do |user|
      [
        link_to(user.name, user)
      ]
    end
  end

  def users
    @users || fetch_users
  end

  def fetch_users
    search_columns = ['users.name']
    users = User.unscoped.select(search_columns).order(sort_column sort_direction)
    users = users.page(page_count).per(per_page)
  end

  def sort_column
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
