class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include ApplicationHelper
  include IntelligentFeature
  require 'uri'
  
  before_action :set_globals

<<<<<<< HEAD
  layout :layout_by_resource
=======
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414


  private
  
<<<<<<< HEAD
  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end
  
  def set_globals
  
    @events = Event.current.all
    @locations = Location.all
    @mainmenuitems = mainmenuItems.sort_by { |item| item.title}
    @meetings = Meeting.all
    @multicasts = Multicast.all
    @pages = Page.all
    @services = Service.all
    @sorted_meetings = Meeting.in_partial.ordered_by_day_and_time.preload(:location, :service).group_by{|meeting| [meeting.service]}
    @submenus = Submenu.alphabetical
    @top_features = featured
    
=======
  def set_globals
    @locations = Location.all
    @meetings = Meeting.all
    @services = Service.all
    @events = Event.all
    @pages = Page.all
    @top_features = featured
    
    @sorted_meetings = Meeting.in_partial.ordered_by_day_and_time.preload(:location, :service).group_by{|meeting| [meeting.service]}
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
  end
  
end
