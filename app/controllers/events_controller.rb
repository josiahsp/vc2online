class EventsController < ApplicationController
  include EventsHelper
  
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:show, :index]
  
  layout "featureless"

  # GET /events
  # GET /events.json
  def index
    @events = Event.current.chronological.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
<<<<<<< HEAD
      params.require(:event).permit(:title, :subtitle, :synopsis, :content, :location_id, :location_building, :location_address, :location_address2, :location_city, :location_state, :location_zip, :location_googlemapsid, :start, :endtime, :videos, :hero_image, :hero_square_image, :cover_image, :thumbnail_image, :hero_image_cache, :hero_square_image_cache, :cover_image_cache, :thumbnail_image_cache, :links, :price)
=======
      params.require(:event).permit(:title, :subtitle, :synopsis, :content, :location_id, :location_building, :location_address, :location_address2, :location_city, :location_state, :location_zip, :location_googlemapsid, :start, :endtime, :videos, :images, :links, :price)
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
    end
end
