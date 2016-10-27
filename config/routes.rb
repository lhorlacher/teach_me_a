Rails.application.routes.draw do
	root 'home#index'

	devise_for :users, controllers: {
   	registrations: 'users/registrations'
 	}

	resources :teachers

	resources :profiles

	resources :students do
		resources :lessons, shallow: true do
			resources :assignments, shallow: true
			resources :lesson_notes, shallow: true
		end
	end




end
