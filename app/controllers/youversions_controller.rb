class YouversionsController < ApplicationController
  before_action :set_youversion, only: [:show, :edit, :update, :destroy]

  # GET /youversions
  # GET /youversions.json
  def index
    @youversions = Youversion.ordered
    @active = @youversions.past.reverseordered.first
    
    redirect_to "https://www.bible.com/events/" + @active.eventnumber.to_s
  end

  # GET /youversions/1
  # GET /youversions/1.json
  def show
  end

  # GET /youversions/new
  def new
    @youversion = Youversion.new
  end

  # GET /youversions/1/edit
  def edit
  end

  # POST /youversions
  # POST /youversions.json
  def create
    @youversion = Youversion.new(youversion_params)

    respond_to do |format|
      if @youversion.save
        format.html { redirect_to dashboard_path + "#youversion", notice: 'Youversion was successfully created.' }
        format.json { redirect_to dashboard_path + "#youversion", status: :created, location: @youversion }
      else
        format.html { render :new }
        format.json { render json: @youversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /youversions/1
  # PATCH/PUT /youversions/1.json
  def update
    respond_to do |format|
      if @youversion.update(youversion_params)
        format.html { redirect_to dashboard_path, notice: 'Youversion was successfully updated.' }
        format.json { redirect_to dashboard_path, status: :ok, location: @youversion }
      else
        format.html { render :edit }
        format.json { render json: @youversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youversions/1
  # DELETE /youversions/1.json
  def destroy
    @youversion.destroy
    respond_to do |format|
      format.html { redirect_to youversions_url, notice: 'Youversion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_youversion
      @youversion = Youversion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def youversion_params
      params.require(:youversion).permit(:series, :title, :start, :eventnumber)
    end
end
