Rails.application.routes.draw do

  get 'prayers/index'
  get 'services/index'
  get 'prayers/new'
  get 'prayers/update'

  devise_for :admins
  resources :features, :services, :meetings, :locations, :pages, :events, :images, :kioskitems, :menuitems, :submenus, :prayers, :multicasts, :collections, :links, :quickitems, :youversions
  resources :contacts do
    get 'archive', on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/' => 'kioskitems#index', constraints: { :subdomain => 'kiosk' }
  
  root :to => 'pages#index'
  get '/contact', to: 'contacts#new'
  get '/post', to: 'contacts#create'
  get '/dashboard', to: 'pages#dashboard'
  get '/prayers' => 'prayers#index'
  
  get '/kiosk', to: 'kioskitems#index'
  get 'podcast.rss', to: 'multicasts#podcast'
  
  Link.all.each do |link|
    get "/#{link.slug}", to: 'links#show', :id => link.id
  end
  
end
