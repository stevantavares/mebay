Rails.application.routes.draw do

    root 'ads#index'
    resources :ads

end

