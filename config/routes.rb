Rails.application.routes.draw do
	root "events#index"
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
		resources :charges
  	resources :attendances
	end
end
