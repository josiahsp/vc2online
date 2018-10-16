class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:new, :create]
  
  layout "featureless"
  
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end
  
  def archive
    @contact = Contact.find(params[:id])
    def archive_message
      @contact.archived = true
      @contact.archiver = current_admin.id
      @contact.save
    end
    
    if archive_message
      redirect_to dashboard_path + "#messages", notice: 'Message successfully archived.'
    else
      redirect_to contact_path(@contact), alert: 'Message could not be archived.'
    end
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to new_contact_path, notice: 'We got your info! We\'ve sent you a copy and we\'ll get back to you soon.' }
        format.json { render :new, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:fname, :lname, :email, :phone, :attendance, :growgroup, :growgroupleader, :dreamteam, :dreamteamleader, :details)
    end
end
