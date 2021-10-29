Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'

  get 'admin', to: 'events#admin', as: 'admin'
  resources :events do
    resources :attendants, only: %i[new create]
    resources :declarations, only: %i[show new create]
    resources :event_collaborators, only: %i[new create]
    resources :collab_declarations, only: %i[show new create]
    get 'attendants', to: 'events#attendants', as: 'asistentes'
    get 'collaborators', to: 'events#collaborators', as: 'colaboradores'
  end

  resources :attendants, only: %i[destroy edit update]
  resources :event_collaborators, only: %i[destroy edit update]
  resources :collaborators, only: %i[new create index destroy edit update]

  get 'extra/:id', to: 'attendants#extra', as: 'extra'
  get 'collab_extra/:id', to: 'event_collaborators#extra', as: 'collab_extra'
  get 'success', to: 'success#index'
  get 'full', to: 'success#full', as: 'full'
  get 'ready/:id', to: 'declarations#ready'
  get 'collab_ready/:id', to: 'collab_declarations#collab_ready'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
