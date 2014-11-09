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
        get 'facebook', :as => 'facebook'
        get 'index', :as => 'index'
        get 'about', :as => 'about'
        get 'contact', :as => 'contact'
        get 'gallery', :as => 'gallery'
        get 'references', :as => 'references'
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
      get 'contact', :as => 'contact'
      get 'gallery', :as => 'gallery'
      get 'menu', :as => 'menus'
      get 'references', :as => 'references'
    end
  end

  resources :templates do
    collection do
      get 'modal', :as => 'modal'
    end
  end

end
