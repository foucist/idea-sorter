Omgpop::Application.routes.draw do
  resource :rankings do
    resource :ideas
  end

  resources :criteria do
    post 'sort', :on => :member
    get 'sort', :on => :member
  end

  resources :ideas do
    post 'sort', :on => :member
  end

  root :to => "rankings#show"

end
