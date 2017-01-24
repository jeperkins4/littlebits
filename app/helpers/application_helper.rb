module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def avatar_url(email, size = 40)
    unless email.blank?
      gravatar_id = Digest::MD5::hexdigest(email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end
  end

  # TODO Change w/ SSL
  def protocol
    Rails.env.production? ? 'https' : 'http'
  end
end
