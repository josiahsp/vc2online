class SubmenusController < ApplicationController
  before_action :set_submenu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:show]
  
  layout "admin"

  # GET /submenus
  # GET /submenus.json
  def index
    @submenus = Submenu.all
  end

  # GET /submenus/1
  # GET /submenus/1.json
  def show
    @menuitems = @submenu.menuitems.alphabetical
  end

  # GET /submenus/new
  def new
    @submenu = Submenu.new
  end

  # GET /submenus/1/edit
  def edit
  end

  # POST /submenus
  # POST /submenus.json
  def create
    @submenu = Submenu.new(submenu_params)

    respond_to do |format|
      if @submenu.save
        format.html { redirect_to dashboard_path + "#menus", notice: 'Submenu was successfully created.' }
        format.json { render :show, status: :created, location: @submenu }
      else
        format.html { render :new }
        format.json { render json: @submenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submenus/1
  # PATCH/PUT /submenus/1.json
  def update
    respond_to do |format|
      if @submenu.update(submenu_params)
        format.html { redirect_to dashboard_path + "#menus", notice: 'Submenu was successfully updated.' }
        format.json { render :show, status: :ok, location: @submenu }
      else
        format.html { render :edit }
        format.json { render json: @submenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submenus/1
  # DELETE /submenus/1.json
  def destroy
    @submenu.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path + "#menus", notice: 'Submenu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submenu
      @submenu = Submenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submenu_params
      params.require(:submenu).permit(:title, :mainmenu)
    end
end
