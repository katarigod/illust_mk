Rails.application.routes.draw do
  namespace :customers do
    get 'buycoin/new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for:customers,skip:[:passwords],controllers:{
    registrations:"customers/registrations",
    sessions:"customers/sessions"
  }

  devise_for :admins,skip:[:registrations,:passwords],controllers:{
    sessions:"admins/sessions"
  }

  namespace :admins do
    resources :pictures,only:[:index,:show,:edit,:update,:destroy]
    resources :publics,only:[:index,:show,:edit,:update]
  end

  scope module: :customers do
    get 'publics/:id' => 'publics#show',as: :mypage
    get 'publics/:id/edit' => 'publics#edit'
    patch 'publics/:id' => 'publics#update'
    # resource :publics,only:[:show,:edit,:update]
    root :to => "homes#top"
    get 'pictures/index'
    resources :pictures,only:[:new,:create,:show,:edit,:update]
    get 'collects' => 'collect#index'
    post 'collects' => 'collect#create'
    resources :buycoins,only:[:index,:new,:create,:show,:update]
  end
end
