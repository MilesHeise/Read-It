Rails.application.routes.draw do
  resources :questions

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :advertisements

  resources :users, only: %i[new create]

  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root 'welcome#index'
end
