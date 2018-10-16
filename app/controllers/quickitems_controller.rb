class QuickitemsController < ApplicationController
  before_action :set_quickitem, only: [:show, :edit, :update, :destroy]

  # GET /quickitems
  # GET /quickitems.json
  def index
    @quickitems = Quickitem.all
  end

  # GET /quickitems/new
  def new
    @quickitem = Quickitem.new
  end

  # GET /quickitems/1/edit
  def edit
  end
  
  def show
    redirect_to @quickitem.path
  end

  # POST /quickitems
  # POST /quickitems.json
  def create
    @quickitem = Quickitem.new(quickitem_params)

    respond_to do |format|
      if @quickitem.save
        format.html { redirect_to dashboard_path + "#quickitems", notice: 'Quickitem was successfully created.' }
        format.json { redirect_to dashboard_path + "#quickitems", status: :created, location: @quickitem }
      else
        format.html { render :new }
        format.json { render json: @quickitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quickitems/1
  # PATCH/PUT /quickitems/1.json
  def update
    respond_to do |format|
      if @quickitem.update(quickitem_params)
        format.html { redirect_to dashboard_path + "#quickitems", notice: 'Quickitem was successfully updated.' }
        format.json { redirect_to dashboard_path + "#quickitems", status: :ok, location: @quickitem }
      else
        format.html { render :edit }
        format.json { render json: @quickitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quickitems/1
  # DELETE /quickitems/1.json
  def destroy
    @quickitem.destroy
    respond_to do |format|
      format.html { redirect_to quickitems_url, notice: 'Quickitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quickitem
      @quickitem = Quickitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quickitem_params
      params.require(:quickitem).permit(:title, :path, :order, :cover_image, :cover_image_cache)
    end
end
