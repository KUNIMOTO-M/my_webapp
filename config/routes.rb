Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get  '/about',    to: 'static_pages#about'
  get  '/help',     to: 'static_pages#help'
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :states,              only: [:create, :destroy] do
    member do
      get 'index'
    end
  end
  resources :microposts,          only: [:index, :create, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :fileas,              only: [:new, :create, :destroy]

  resources :users,               only: [:index, :edit, :update] do
    collection do
      get 'set'
      get 'search'
    end
    member do
      get 'show_notice'
      get 'following'
      get 'followers'
      get 'show_microposts'
      get 'show_files'
    end
  end

  resources :notices do
    collection do
      get 'search'
    end
  end
  
  resources :messages,           only: [:create]
  resources :rooms,              only: [:create, :show, :index]
  resources :relationships,       only: [:create, :destroy]
end
