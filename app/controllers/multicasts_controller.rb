class MulticastsController < ApplicationController

  include MulticastsHelper
  
  before_action :set_multicast, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  
  layout "featureless"
  
  # GET /multicasts
  # GET /multicasts.json
  def index
    @multicasts = Multicast.all
  end

  # GET /multicasts/1
  # GET /multicasts/1.json
  def show
  end
  
  def podcast
    @podcasts = Multicast.all.order('pubdate desc')
  end

  # GET /multicasts/new
  def new
    @multicast = Multicast.new
    @collections = Collection.all.order("enddate desc")
    render layout: "admin"
  end

  # GET /multicasts/1/edit
  def edit
    @collections = Collection.all.order("enddate desc")
    render layout: "admin"
  end

  # POST /multicasts
  # POST /multicasts.json
  def create
    @multicast = Multicast.new(multicast_params)
    @collections = Collection.all.order("enddate desc")
    
    respond_to do |format|
      if @multicast.save
        format.html { redirect_to @multicast, notice: 'Multicast was successfully created.' }
        format.json { render :show, status: :created, location: @multicast }
      else
        format.html { render :new }
        format.json { render json: @multicast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multicasts/1
  # PATCH/PUT /multicasts/1.json
  def update
  @collections = Collection.all.order("enddate desc")
  
    respond_to do |format|
      if @multicast.update(multicast_params)
        format.html { redirect_to @multicast, notice: 'Multicast was successfully updated.' }
        format.json { render :show, status: :ok, location: @multicast }
      else
        format.html { render :edit }
        format.json { render json: @multicast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multicasts/1
  # DELETE /multicasts/1.json
  def destroy
    @multicast.destroy
    respond_to do |format|
      format.html { redirect_to multicasts_url, notice: 'Multicast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multicast
      @multicast = Multicast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multicast_params
      params.require(:multicast).permit(:title, :author, :collection_id, :summary, :guid, :pubdate, :duration, :duration1, :duration2, :duration3, :keywords, :cover_image, :hero_image, :cover_image_cache, :hero_image_cache, :audio, :audio_cache, :video, :video_cache)
    end
end
