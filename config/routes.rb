Rails.application.routes.draw do
  get 'like/create'
  get 'like/destroy'
  get 'like/index'
  get 'create/destroy'
  get 'create/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#home'
  get  '/about',    to: 'static_pages#about'
  get  '/help',     to: 'static_pages#help'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :like, only: %i[index create destroy] do
    collection do
      get 'userid'
    end
  end

  resources :states, only: %i[create destroy] do
    member do
      get 'index'
    end
  end
  resources :microposts, only: %i[index create destroy] do
    collection do
      get 'search'
    end
  end

  resources :fileas,              only: %i[new create destroy]

  resources :users,               only: %i[index edit update] do
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
  resources :rooms,              only: %i[create show index]
  resources :relationships, only: %i[create destroy]
end
