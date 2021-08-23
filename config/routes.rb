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
      resources :content
    end
  end
  post 'users/:user_id/quests/:quest_id/content/:id',to: 'content#create',as: 'create_user_quest_content'
  post 'quests/:id' => 'quests#create', as: 'create_quest'
  resources :users, only: [:show, :edit, :update]

  resources :quests do
    resource :user_quests, only: [:create, :destroy]
  end
end
