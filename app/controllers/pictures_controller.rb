class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all   
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = current_user.pictures.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = current_user.pictures.new(picture_params)

    respond_to do |format|
      if user_signed_in?
        if @picture.save 
          flash[:success] = "Picture was successfully created."
          format.html { redirect_to @picture}
          format.json { render action: 'show', status: :created, location: @picture }
        end
      else
        flash[:alert] = "You must be signed in to do that."
        format.html { redirect_to new_user_session_path}
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if current_user 
        if @picture.update(picture_params)
          flash[:success] = "Picture was successfully updated."
          format.html { redirect_to @picture }
          format.json { head :no_content }
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:title, :caption, :image, :user_id)
    end


end
