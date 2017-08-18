Rails.application.routes.draw do
  root 'application#index'
  
    # get 'users/:id' => 'users#show'
    post 'users' => 'users#create'
    get 'users/:id' => 'users#show'

  
  
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    get 'ideas' => 'ideas#index'
    get 'ideas/:id' => 'ideas#show'
    post 'ideas' => 'ideas#create'

    post 'ideas/:id/likes' => 'liked_bys#create'

end
