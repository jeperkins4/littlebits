class PhotosController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  expose(:photos) {  Photo.all }
  expose(:photo, attributes: :photo_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: PhotosDatatable.new(view_context) }
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    respond_to do |format|
      if photo.save
        format.html { redirect_to photo, notice: 'Photo was successfully created.' }
        format.json { render json: photo, status: ':created', location: photo }
      else
        format.html { render action: 'new' }
        format.json { render json: photo.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    respond_to do |format|
      if photo.update(photo_params)
        format.html { redirect_to photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: photo.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:name, :description, :priority, :invention_id, :media)
    end
end
