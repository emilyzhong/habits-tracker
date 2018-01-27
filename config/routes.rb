Rails.application.routes.draw do
    get 'habits/index'

    resources :habits

    root 'habits#index'
end
