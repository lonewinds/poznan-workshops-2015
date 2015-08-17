Rails.application.routes.draw do
  root controller: :visitors, action: :index

  devise_for :users

  resources :students do
    get :subjects
  end

  get '/reports' => 'reports#subjects', as: 'report_subjects'

  resources :teachers do
    get :subjects
  end

  resources :visitors, only: [:index]
end
