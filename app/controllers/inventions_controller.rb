class InventionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  respond_to :html, :json

  expose(:inventions) {  Invention.all }
  expose(:invention, attributes: :invention_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: InventionsDatatable.new(view_context) }
    end
  end

  # POST /inventions
  # POST /inventions.json
  def create
    respond_to do |format|
      if invention.save
        format.html { redirect_to invention, notice: 'Invention was successfully created.' }
        format.json { render json: invention, status: ':created', location: invention }
      else
        format.html { render action: 'new' }
        format.json { render json: invention.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /inventions/1
  # PUT /inventions/1.json
  def update
    respond_to do |format|
      if invention.update(invention_params)
        format.html { redirect_to invention, notice: 'Invention was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: invention.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /inventions/1
  # DELETE /inventions/1.json
  def destroy
    invention.destroy

    respond_to do |format|
      format.html { redirect_to inventions_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def invention_params
      params.require(:invention).permit(:title, :description, :user_name, :email, bits: [], materials: [],
                                       photos_attributes: [:id, :media, :name, :description, :_destroy])
    end
end
