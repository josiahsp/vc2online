class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  layout "featureless"
  
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @meetings = Meeting.ordered_by_day_and_time.preload(:location, :service).group_by{|meeting| [meeting.service]}
  end

  # GET /locations/new
  def new
    @location = Location.new
    render layout: "admin"
  end

  # GET /locations/1/edit
  def edit
    render layout: "admin"
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:title, :building, :address, :address2, :city, :state, :zip, :phone, :leader, :googlemapsid, :slug, :hero_image, :hero_image_cache, :hero_square_image, :hero_square_image_cache, :thumbnail_image, :thumbnail_image_cache, :cover_image, :cover_image_cache)
    end
end
