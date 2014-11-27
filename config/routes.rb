BaseApp::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :registrations => 'registrations' }
  devise_scope :user do
    get "/login" => 'devise/sessions#new'
  end
  root :to => 'pages#index'

  get '/admin' => 'admin/base#index', :as => 'admin'
  get 'users' => 'pages#index'

  namespace 'admin' do
    resources :users
    resources :pages do
      collection do
        get 'settings', :as => 'settings'
        get 'index', :as => 'index'
        get 'about', :as => 'about'
        get 'events', :as => 'events'
        get 'contact', :as => 'contact'
        get 'gallery', :as => 'gallery'
        get 'partners', :as => 'partners'
      end
    end
    resources :settings do
      collection do
        match 'create_or_update', :via => [:put, :post], :as => 'save'
      end
    end
  end

  resources :pages do
    collection do
      get 'index', :as => 'index'
      get 'about', :as => 'about'
      get 'events', :as => 'events'
      get 'contact', :as => 'contact'
      get 'gallery', :as => 'gallery'
      get 'menu', :as => 'menus'
      get 'partners', :as => 'partners'
    end
  end

  resources :templates do
    collection do
      get 'modal', :as => 'modal'
    end
  end

end
