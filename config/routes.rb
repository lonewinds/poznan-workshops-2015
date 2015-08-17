Rails.application.routes.draw do
  devise_for :users
  resources :students do
    get :subjects
  end
  get '/reports' => 'reports#subjects'
  resources :teachers
  resources :visitors, only: [:index]
end
