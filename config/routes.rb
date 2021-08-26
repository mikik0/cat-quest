Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    root 'devise/sessions#new'
    get  'login' => 'devise/sessions#new'
    post 'login' => 'devise/sessions#create'
    delete 'logout' => 'devise/sessions#destroy'
    get  'signup' => 'devise/registrations#new'
    post  'signup' => 'devise/registrations#create'
  end

  resources :users, only: [:show, :edit, :update]

  resources :myquests, only: [:index], controller: :users do
    resources :contents, only: [:show] do
      resources :memos, only: [:create, :destroy]
    end
  end

  resources :quests do
    resource :user_quests, only: [:create, :destroy]
  end

  get 'techtag/contents', to: 'tags#contents'
  get 'techtag/index', to: 'tags#index'
  get 'techtag/create', to: 'tags#create'
  get 'techtag/event', to: 'tags#event'
  
end
