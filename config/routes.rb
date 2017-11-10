Rails.application.routes.draw do
  resources :questions

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: %i[create destroy]
    resources :favorites, only: %i[create destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :advertisements

  resources :users, only: %i[new create show]

  resources :sessions, only: %i[new create destroy]

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root 'welcome#index'
end
