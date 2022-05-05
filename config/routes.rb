Rails.application.routes.draw do
  namespace :customers do
    get 'publics/show'
    get 'publics/edit'
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
    resource :publics,only:[:show,:edit,:update]
    root :to => "homes#top"
    resources :pictures,only:[:index,:new,:create,:show,:edit,:update]

  end
end
