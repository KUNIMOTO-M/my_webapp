Rails.application.routes.draw do
  root 'home#home'
  devise_for :users
  
  namespace 'api', {format: 'json'} do
    namespace 'v1' do
      get   '/home',    to:  'static_pages#home'
      get  '/about',    to: 'static_pages#about'
      get  '/help',     to: 'static_pages#help'
      resources :notices do
        collection do
          get 'search'
        end
      end
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :microposts,          only: [:create, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :fileas,              only: [:new, :create, :destroy]

  resources :users  do
    collection do
      get 'set'
      get 'search'
    end
    member do
      get 'following'
      get 'followers'
      get 'show_microposts'
      get 'show_files'
    end
  end


  
  resources :messages,           only: [:create]
  resources :rooms,              only: [:create, :show, :index]
  resources :relationships,       only: [:create, :destroy]
end
