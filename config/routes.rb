Rails.application.routes.draw do

	root 'home#index'

	devise_for :users, controllers: {
   	registrations: 'users/registrations',
   	sessions: 'users/sessions'
 	}

	resources :teachers

	resources :profiles

	resources :students do
		resources :lessons, shallow: true do
			resources :assignments, shallow: true
			resources :lesson_notes, shallow: true
		end
	end

	get '/students/:student_id/lesson_notes', to: 'lesson_notes#student_index', as: 'student_lesson_notes'

	post '/assignments/:assignment_id/practices', to: 'practices#create', as: 'assignment_practices'

	delete '/practices/:id', to: 'practices#destroy', as: 'practice'




end
