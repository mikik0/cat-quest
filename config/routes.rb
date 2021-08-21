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

  resources :users, only: [:show] do
    resources :quests, only: [:index, :show, :edit, :update, :delete] do
      resources :content, only: [:index, :show]
    end
  end

  resources :users, only: [:show, :edit, :update]
  resources :quests

  get 'techtag/contents', to: 'tags#contents'
  get 'techtag/index', to: 'tags#index'
  get 'techtag/create', to: 'tags#create'
end
