Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :kanjis, only: [ :index ]
      resources :core_words, only: [ :index ]
      resources :kanji_cards, only: [ :index ]
    end
  end
end
