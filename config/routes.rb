Rails.application.routes.draw do
<<<<<<< HEAD
  resources :quickitems
  resources :youversions
  get 'prayers/index'
=======
  resources :features
  resources :events
  resources :services
  get 'services/index'
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414

  get 'prayers/new'

  get 'prayers/update'

  devise_for :admins
  resources :features, :services, :meetings, :locations, :pages, :events, :images, :kioskitems, :menuitems, :submenus, :prayers, :multicasts, :collections, :links
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
