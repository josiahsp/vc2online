class PrayersController < ApplicationController

  require 'builder'

  before_action :set_prayer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:rss]
  
  layout "admin"
  
  def index
    respond_to do |format|
        format.html do
          @prayers = Prayer.active.all
        end
    
        format.rss do
          @prayers = Prayer.active.all
        end
      end
  end

  def new
    @prayer = Prayer.new
  end
  
  def create
    @prayer = Prayer.new(prayer_params)

    respond_to do |format|
      if @prayer.save
        format.html { redirect_to dashboard_path + "#prayer", notice: 'Prayer Point was successfully created.' }
        format.json { redirect_to dashboard_path + "#prayer", status: :created, location: @prayer }
      else
        format.html { render :new }
        format.json { render json: @prayer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @prayer.update(prayer_params)
        format.html { redirect_to dashboard_path + "#prayers", notice: 'Prayer Point was successfully updated.' }
        format.json { redirect_to dashboard_path + "#prayers", status: :ok, location: @prayer }
      else
        format.html { render :edit }
        format.json { render json: @prayer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @prayer.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url + "#prayers", notice: 'Prayer Point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prayer
      @prayer = Prayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prayer_params
      params.require(:prayer).permit(:title, :details, :scripture_1, :scripture_2, :scripture_3, :active)
    end

end