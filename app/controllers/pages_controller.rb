class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:show, :index]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end
  
  # GET /dashboard
  def dashboard
    @contacts = Contact.all
    @events = Event.current.chronological.all
    @features = Feature.chronological.all
    @links = Link.alphabetical.all
    @locations = Location.all
    @kioskitems = Kioskitem.ordered.all
    @prayers = Prayer.active.all
    @quickitems = Quickitem.ordered.all
    @youversion = Youversion.past.reverseordered.first
    @youversions = Youversion.reverseordered.current.all
    render layout: "admin"
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    render layout: "featureless"
  end

  # GET /pages/new
  def new
    @page = Page.new
    render layout: "admin"
  end

  # GET /pages/1/edit
  def edit
    render layout: "admin"
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to dashboard_path + "#pages", notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to dashboard_path + "#pages", notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
    params.require(:page).permit(:title, :keywords, :content, :hero_image, :hero_image_cache, :hero_square_image, :square_hero_image_cache, :cover_image, :cover_image_cache, :thumbnail_image, :thumbnail_image_cache, :slug)
    end
end
