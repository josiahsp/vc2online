class KioskitemsController < ApplicationController
  before_action :set_kioskitem, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:index]


  layout "admin"
  
  # GET /kioskitems
  # GET /kioskitems.json
  def index
    @kioskitems = Kioskitem.active.ordered.all
    render layout: "kiosk"
  end

  # GET /kioskitems/1
  # GET /kioskitems/1.json
  def show
  end

  # GET /kioskitems/new
  def new
    @kioskitem = Kioskitem.new
  end

  # GET /kioskitems/1/edit
  def edit
  end

  # POST /kioskitems
  # POST /kioskitems.json
  def create
    @kioskitem = Kioskitem.new(kioskitem_params)

    respond_to do |format|
      if @kioskitem.save
        format.html { redirect_to dashboard_path + "#kiosk", notice: 'Kiosk Item was successfully created.' }
        format.json { render :show, status: :created, location: @kioskitem }
      else
        format.html { render :new }
        format.json { render json: @kioskitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kioskitems/1
  # PATCH/PUT /kioskitems/1.json
  def update
    respond_to do |format|
      if @kioskitem.update(kioskitem_params)
        format.html { redirect_to dashboard_path + "#kiosk", notice: 'Kiosk Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @kioskitem }
      else
        format.html { render :edit }
        format.json { render json: @kioskitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kioskitems/1
  # DELETE /kioskitems/1.json
  def destroy
    @kioskitem.destroy
    respond_to do |format|
      format.html { redirect_to kioskitems_url, notice: 'Kiosk Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kioskitem
      @kioskitem = Kioskitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kioskitem_params
      params.require(:kioskitem).permit(:title, :path, :cover_image, :cover_image_cache, :starttime, :endtime, :active)
    end
end
