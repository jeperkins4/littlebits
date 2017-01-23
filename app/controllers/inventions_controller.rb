class InventionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource
  respond_to :html, :json

  expose(:inventions) {  Invention.order(:title) }
  expose(:invention, attributes: :invention_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: InventionsDatatable.new(view_context) }
    end
  end

  def new
    invention.build_video
  end

  def edit
    invention.build_video if invention.video.nil?
  end

  # POST /inventions
  # POST /inventions.json
  def create
    invention.save
    respond_with invention
  end

  # PUT /inventions/1
  # PUT /inventions/1.json
  def update
    invention.update(invention_params)
    respond_with invention
  end

  # DELETE /inventions/1
  # DELETE /inventions/1.json
  def destroy
    invention.destroy
    respond_with inventions, location: inventions_path
  end

  private
  # Only allow a trusted parameter "white list" through.
  def invention_params
    params.require(:invention).permit(:user_id, :title, :description, :user_name, :email, :video, bits: [], materials: [],
                                     photos_attributes: [:id, :media, :name, :description, :_destroy],
                                     video_attributes: [:id, :media, :name, :description, :_destroy])
  end
end
