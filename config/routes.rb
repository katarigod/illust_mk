Rails.application.routes.draw do
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
    resources :publics,only:[:index,:show,:update,:destroy]
    get 'buycoins/:id' => 'buycoins#show'
    resources :buycoins,only:[:index,:show,:update]
    get 'revenues' => 'revenues#index',as: :revenue
  end

  scope module: :customers do
    get 'publics/:id' => 'publics#show',as: :mypage
    get 'publics/:id/edit' => 'publics#edit',as: :editpage
    patch 'publics/:id' => 'publics#update',as: :updatepage
    # resource :publics,only:[:show,:edit,:update]
    root :to => "homes#top"
    get 'pictures/mypictures/:id' => 'pictures#mypictures',as: :mypicture
    get 'pictures/index'
    resources :pictures,only:[:new,:create,:show,:edit,:update]
    get 'collects' => 'collects#index'
    post 'collects' => 'collects#create'
    patch 'collects/:id' => 'collects#set',as: :set

    get 'buycoins/bought' => 'buycoins#bought',as: :bought
    get 'buycoins/change' => 'buycoins#change',as: :change
    post 'buycoins/change' => 'buycoins#changecoin',as: :changecoin
    get 'buycoins/confirm' => 'buycoins#confirm',as: :confirm
    post 'buycoins/confirm' => 'buycoins#confirm'
    resources :buycoins,only:[:index,:new,:create,:show,:update]

    # resources :change_coins,only:[:new,:create]
  end
end
