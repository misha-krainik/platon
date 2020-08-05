Platon::Engine.routes.draw do
  resource :callbacks, only: :create
  resource :errors, only: :show
  resource :forms, only: :show
end
