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
        get 'partners', :as => 'partners'
        get 'gallery1', :as => 'gallery1'
        get 'gallery2', :as => 'gallery2'
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
      get 'partners', :as => 'partners'
      get 'menu1', :as => 'menus1'
      get 'menu2', :as => 'menus2'
      get 'menu3', :as => 'menus3'
      get 'menu4', :as => 'menus4'
      get 'gallery1', :as => 'gallery1'
      get 'gallery2', :as => 'gallery2'
    end
  end

  resources :templates do
    collection do
      get 'modal', :as => 'modal'
    end
  end

end
