Rails.application.routes.draw do
    get 'welcome/index'
	get 'festival/show'
	
	root 'welcome#index'
	resources :organizers
	resources :festivals
	resources :festival_days
	resources :concerts
	resources :styles
	resources :performers
	resources :songs
	resources :performers_styles
	resources :concerts_performers
	
	get 'festival/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
