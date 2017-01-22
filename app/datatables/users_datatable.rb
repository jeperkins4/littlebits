class UsersDatatable < BaseDatatable
  delegate :current_user, to: :@view

  def as_json(options = {})
    json_builder(User.count, users.total_count, data)
  end

private
  def data
    users.map do |user|
      [
        link_to(user.name, user),
        links(user)
      ]
    end
  end

  def users
    @users || fetch_results(User)
  end

  def columns
    ['users.name', 'users.email', 'users.id']
  end

  def exceptions
    ['users.id']
  end
end
