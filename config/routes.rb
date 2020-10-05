Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, module: 'users', skip: :sessions
  devise_for :users, module: 'users', path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, only: :sessions
  resources :posts, except: %i[edit update] do
    resources :post_reviews, only: %i[index create destroy] do
      resource :post_review_likes, only: %i[create destroy]
    end
  end
end
