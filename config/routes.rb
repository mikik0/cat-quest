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
    resources :content, only: [:show] do
      resources :memos, only: [:create, :destroy]
      resources :user_contents, only: [:create]
    end
  end

  post 'memo/:id' => 'goods#create', as: 'create_good'
  delete 'memo/:id' => 'goods#destroy', as: 'delete_good'

  resources :quests do
    resource :user_quests, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  get 'techtag/contents', to: 'tags#contents'
  get 'techtag/index', to: 'tags#index'
  get 'techtag/create', to: 'tags#create'
  get 'techtag/event', to: 'tags#event'

end
