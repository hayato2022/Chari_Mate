Rails.application.routes.draw do

  
  # ユーザー側
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

# ログアウトの際method の delete が get になってしまうので以下を追記
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'

    # ゲストログイン
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  scope module: :public do
    root to: "posts#index"
    get "homes/about"
    resources :posts do
      # いいね機能のidはurlに含まなくていいため、resourceを使用
      resource :likes, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    # public/calory
    delete "calories/destroy_all" => "calories#destroy_all"
    resources :calories, only: [:new, :create, :index, :show, :destroy]

    delete "notifications/destroy_all" => "notifications#destroy_all"
    resources :notifications, only: [:index]

    # public/user
    get "users/unsubscribe" => "users#unsubscribe"
    patch "users/withdrawal" => "users#withdrawal"
    resources :users, only: [:show, :edit, :update] do
      get :search, on: :collection
      resource :relationships , only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get :likes
      end
    end

  end

  #管理者側
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admin/sessions#guest_sign_in'
  end

  namespace :admin do
    root to: "users#index"
    resources :users, only: [:show, :edit, :update] do
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
