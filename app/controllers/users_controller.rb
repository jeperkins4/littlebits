class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  expose(:users) {  User.all }
  expose(:user, attributes: :user_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: UsersDatatable.new(view_context) }
    end
  end

  def preferences
  end

  def create
    user.save
    respond_with user
  end

  def update
    user.update(user_params)
    respond_with user
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    user.destroy
    respond_with users, location: users_path
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :time_zone, :latitude, :longitude, :work_address, :home_address, role_ids: [], service_ids: [], business_ids: [], franchise_ids: [])
    end
end
