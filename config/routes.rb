Rails.application.routes.draw do
  resources :posts, only: [:index, :show]

  match '*path' => 'pages#show', constraints: ->(request) { Page.path_exists?(request.path) }
end
